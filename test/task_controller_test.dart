import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do/business/models/task_model.dart';
import 'package:to_do/business/repos/task_repo.dart';
import 'package:to_do/modules/home/home_controller.dart';


class MockTaskRepository extends Mock implements TaskRepository {}
class FakeTask extends Fake implements Task {}

void main() {
  late MockTaskRepository mockTaskRepository;
  late HomeController taskController;


  setUpAll(() {
    // Register the fallback value for Task
    registerFallbackValue(FakeTask());
  });
  // Set up the test environment
  setUp(() {
    mockTaskRepository = MockTaskRepository();
    Get.put<TaskRepository>( mockTaskRepository);
    taskController = HomeController();

    // Stub the repository methods
    when(() => mockTaskRepository.getTasks()).thenReturn([]);
    when(() => mockTaskRepository.updateTask(any())).thenAnswer((_) async {});
  });
  const taskTitle = 'Test Task';
  final task = Task.newTask(taskTitle);
  test('should add a task with time-based ID and update the task list', () async {
    // Arrange

    when(() => mockTaskRepository.addTask(taskTitle)).thenAnswer((_) async => task);
    when(() => mockTaskRepository.getTasks()).thenReturn([task]);

    // Act
    await taskController.addTask(taskTitle);

    // Assert
    expect(taskController.tasks.length, 1);
    expect(taskController.tasks.first.title, 'Test Task');
    expect(taskController.tasks.first.id, isNotNull);
    verify(() => mockTaskRepository.addTask(taskTitle)).called(1);
  });

  test('should toggle task completion status', () async {
    // Arrange
    when(() => mockTaskRepository.getTasks()).thenReturn([task]);
    when(() => mockTaskRepository.updateTask(any())).thenAnswer((_) async {});

    // Act
     taskController.loadTasks(); // Load tasks into the controller
    final initialStatus = taskController.tasks.first.isCompleted;

    // Assert initial status
    expect(initialStatus, false, reason: "Initial task status should be false.");

    // Act - Toggle task completion
    await taskController.toggleTaskCompletion(task.id);

    // Assert - Check if the status is updated
    final updatedStatus = taskController.tasks.first.isCompleted;
    expect(updatedStatus, true, reason: "Task completion status should toggle to true.${taskController.tasks.first.title}");

    // Verify updateTask was called
    // verify(() => mockTaskRepository.updateTask(any())).called(1);
  });


}
