import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do/business/models/task_model.dart';
import 'package:to_do/business/repos/task_repo.dart';
import 'package:to_do/business/services/hive_service.dart';

class MockHiveService extends Mock implements HiveService {}

void main() {
  late MockHiveService mockHiveService;
  late TaskRepository taskRepository;

  // Set up the test environment
  setUp(() async {
    mockHiveService = MockHiveService();
    taskRepository = TaskRepository(hiveService: mockHiveService);
  });

  test('should add a task with time-based ID', () async {
    // Arrange
    const taskTitle = 'Test Task';
    final Task task = Task.newTask(taskTitle);
    when(() => mockHiveService.addTask(taskTitle)).thenAnswer((_) async => task);

    // Act
    final addedTask = await taskRepository.addTask(taskTitle);

    // Assert
    expect(addedTask.title, taskTitle);
    expect(addedTask.isCompleted, false);
    expect(addedTask.id, isNotNull);
    verify(() => mockHiveService.addTask(taskTitle)).called(1);
  });

  test('should get all tasks', () async {
    // Arrange
    final Task task = Task.newTask('Test Task');
    when(() => mockHiveService.getAllTasks()).thenReturn([task]);

    // Act
    final tasks = taskRepository.getTasks();

    // Assert
    expect(tasks.length, 1);
    expect(tasks.first.title, 'Test Task');
    expect(tasks.first.id, isNotNull);
    verify(() => mockHiveService.getAllTasks()).called(1);
  });

  test('should update a task successfully', () async {
    // Arrange
    final Task task = Task.newTask('Test Task');
    when(() => mockHiveService.updateTask(task)).thenAnswer((_) async {});

    // Act
    await taskRepository.updateTask(task);

    // Assert
    verify(() => mockHiveService.updateTask(task)).called(1);
  });


}
