import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodels/task_view_model.dart';
import '../models/task.dart';
import '../theme/app_theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskViewModel>().loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Taskify',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Theme.of(context).colorScheme.brandGradient,
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Consumer<TaskViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              Column(
                children: [
                  _buildTappableTaskStats(viewModel),
                  Expanded(
                    child: viewModel.tasks.isEmpty
                        ? _buildEmptyState()
                        : _buildTaskList(viewModel),
                  ),
                ],
              ),
              // Celebration overlay
              if (viewModel.showCompletionCelebration)
                _showCelebrationSnackBar(),
            ],
          );
        },
      ),
      floatingActionButton: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: 1.0,
        child: FloatingActionButton(
          onPressed: () => _showAddTaskDialog(context),
          child: const Icon(Icons.add, size: 28),
        ),
      ),
    );
  }

  Widget _buildTappableTaskStats(TaskViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildTappableStatItem(
              'Total',
              viewModel.totalTasks,
              Theme.of(context).colorScheme.taskTotalColor,
              TaskFilter.all,
              viewModel.currentFilter == TaskFilter.all,
              viewModel,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildTappableStatItem(
              'Active',
              viewModel.activeTasks,
              Theme.of(context).colorScheme.taskPendingColor,
              TaskFilter.active,
              viewModel.currentFilter == TaskFilter.active,
              viewModel,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildTappableStatItem(
              'Done',
              viewModel.completedTasks,
              Theme.of(context).colorScheme.taskCompletedColor,
              TaskFilter.completed,
              viewModel.currentFilter == TaskFilter.completed,
              viewModel,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTappableStatItem(
    String label,
    int count,
    Color color,
    TaskFilter filter,
    bool isSelected,
    TaskViewModel viewModel,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: InkWell(
        onTap: () => viewModel.setFilter(filter),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected 
                ? color.withValues(alpha: 0.2)
                : color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected 
                  ? color.withValues(alpha: 0.5)
                  : color.withValues(alpha: 0.3),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: isSelected ? [
              BoxShadow(
                color: color.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ] : null,
          ),
          child: Column(
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: GoogleFonts.lato(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                child: Text(count.toString()),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: GoogleFonts.lato(
                  fontSize: 12,
                  color: isSelected 
                      ? color 
                      : Theme.of(context).colorScheme.textSubtitle,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.task_alt,
            size: 64,
            color: Theme.of(context).colorScheme.textCaption,
          ),
          const SizedBox(height: 16),
          Text(
            'No tasks yet',
            style: GoogleFonts.lato(
              fontSize: 18,
              color: Theme.of(context).colorScheme.textSubtitle,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap + to add your first task',
            style: GoogleFonts.lato(
              fontSize: 14,
              color: Theme.of(context).colorScheme.textCaption,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList(TaskViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.tasks.length,
      itemBuilder: (context, index) {
        final task = viewModel.tasks[index];
        return AnimatedContainer(
          duration: Duration(milliseconds: 300 + (index * 100)),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()
            ..translate(0.0, 0.0)
            ..scale(1.0),
          child: _buildTaskItem(task, viewModel),
        );
      },
    );
  }

  Widget _buildTaskItem(TaskItem task, TaskViewModel viewModel) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Card(
          elevation: task.isTaskCompleted ? 2 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: task.isTaskCompleted 
                  ? Theme.of(context).colorScheme.taskCompletedColor.withValues(alpha: 0.3)
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: task.isTaskCompleted
                  ? Theme.of(context).colorScheme.taskCompletedGradient
                  : null,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: AnimatedScale(
                duration: const Duration(milliseconds: 200),
                scale: task.isTaskCompleted ? 1.1 : 1.0,
                child: Checkbox(
                  value: task.isTaskCompleted,
                  onChanged: (_) => viewModel.toggleTaskCompletion(task.taskId),
                  activeColor: Theme.of(context).colorScheme.taskCompletedColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              title: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: GoogleFonts.lato(
                  decoration: task.isTaskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: task.isTaskCompleted 
                      ? Theme.of(context).colorScheme.textSubtitle 
                      : Theme.of(context).colorScheme.textMain,
                  fontWeight: task.isTaskCompleted 
                      ? FontWeight.normal 
                      : FontWeight.w600,
                  fontSize: 16,
                ),
                child: Text(task.taskTitle),
              ),
              subtitle: task.taskDescription.isNotEmpty
                  ? AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: GoogleFonts.lato(
                        color: task.isTaskCompleted 
                            ? Theme.of(context).colorScheme.textCaption 
                            : Theme.of(context).colorScheme.textSubtitle,
                      ),
                      child: Text(task.taskDescription),
                    )
                  : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () => _showEditTaskDialog(context, task),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.taskTotalColor.withValues(alpha: 0.1),
                    foregroundColor: Theme.of(context).colorScheme.taskTotalColor,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _showDeleteConfirmation(context, task, viewModel),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.taskPendingColor.withValues(alpha: 0.1),
                    foregroundColor: Theme.of(context).colorScheme.taskPendingColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const TaskDialog(),
    );
  }

  void _showEditTaskDialog(BuildContext context, TaskItem task) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => TaskDialog(task: task),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    TaskItem task,
    TaskViewModel viewModel,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Task', style: GoogleFonts.lato()),
        content: Text('Are you sure you want to delete "${task.taskTitle}"?', style: GoogleFonts.lato()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.lato()),
          ),
          TextButton(
            onPressed: () {
              viewModel.deleteTask(task.taskId);
              Navigator.pop(context);
            },
            child: Text('Delete', style: GoogleFonts.lato()),
          ),
        ],
      ),
    );
  }

  Widget _showCelebrationSnackBar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          backgroundColor: Theme.of(context).colorScheme.feedbackSuccess,
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_box_rounded, color: Colors.white, size: 24),
              const SizedBox(width: 8),
              Text(
                'Task Completed!',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
    });
    return const SizedBox.shrink();
  }
}

class TaskDialog extends StatefulWidget {
  final TaskItem? task;

  const TaskDialog({super.key, this.task});

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.taskTitle ?? '');
    _descriptionController = TextEditingController(text: widget.task?.taskDescription ?? '');
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.task != null;
    
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 400,
                  maxHeight: 500,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.surface,
                      Theme.of(context).colorScheme.surface.withValues(alpha: 0.95),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header with gradient
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: Theme.of(context).colorScheme.brandGradient,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isEditing ? Icons.edit : Icons.add_task,
                            color: Colors.white,
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              isEditing ? 'Edit Task' : 'Add New Task',
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: _isLoading ? null : () => Navigator.pop(context),
                            icon: const Icon(Icons.close, color: Colors.white),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white.withValues(alpha: 0.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Form content
                    Flexible(
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title field
                              Text(
                                'Task Title',
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.textMain,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: _titleController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter task title...',
                                    prefixIcon: Icon(
                                      Icons.title,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Theme.of(context).colorScheme.surface,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Please enter a task title';
                                    }
                                    return null;
                                  },
                                  textCapitalization: TextCapitalization.sentences,
                                ),
                              ),
                              
                              const SizedBox(height: 20),
                              
                              // Description field
                              Text(
                                'Description (Optional)',
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.textMain,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: _descriptionController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter task description...',
                                    prefixIcon: Icon(
                                      Icons.description_outlined,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Theme.of(context).colorScheme.surface,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                  ),
                                  maxLines: 3,
                                  textCapitalization: TextCapitalization.sentences,
                                ),
                              ),
                              
                              const SizedBox(height: 32),
                              
                              // Action buttons
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 56,
                                      child: ElevatedButton(
                                        onPressed: _isLoading ? null : _saveTask,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(context).colorScheme.brandRedPrimary, // Use your red color or gradient
                                          shadowColor: Colors.transparent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          minimumSize: const Size.fromHeight(56),
                                        ),
                                        child: _isLoading
                                            ? const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                ),
                                              )
                                            : Text(
                                                isEditing ? 'Update Task' : 'Add Task',
                                                style: GoogleFonts.lato(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: SizedBox(
                                      height: 56,
                                      child: ElevatedButton(
                                        onPressed: _isLoading ? null : () => Navigator.pop(context),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                            side: BorderSide(
                                              color: Theme.of(context).colorScheme.outline,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Cancel',
                                          style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context).colorScheme.textMain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _saveTask() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final viewModel = context.read<TaskViewModel>();
      final title = _titleController.text.trim();
      final description = _descriptionController.text.trim();

      if (widget.task != null) {
        final updatedTask = widget.task!.copyWith(
          taskTitle: title,
          taskDescription: description,
        );
        await viewModel.updateTask(updatedTask);
      } else {
        await viewModel.addTask(title, description: description);
      }

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving task: $e', style: GoogleFonts.lato()),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}