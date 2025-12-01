package com.dor.taskmanager.service;

import com.dor.taskmanager.model.Task;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

@Service
public class TaskService {

    private final ConcurrentHashMap<Long, Task> tasks = new ConcurrentHashMap<>();
    private final AtomicLong idGenerator = new AtomicLong(1);

    public List<Task> getAllTasks() {
        return new ArrayList<>(tasks.values());
    }

    public Optional<Task> getTaskById(Long id) {
        return Optional.ofNullable(tasks.get(id));
    }

    public Task createTask(Task taskRequest) {
        Long id = idGenerator.getAndIncrement();
        LocalDateTime now = LocalDateTime.now();

        Task task = new Task(
                id,
                taskRequest.getTitle(),
                taskRequest.getDescription(),
                false,
                now,
                now
        );

        tasks.put(id, task);
        return task;
    }

    public Optional<Task> updateTask(Long id, Task taskRequest) {
        Task existing = tasks.get(id);
        if (existing == null) {
            return Optional.empty();
        }

        existing.setTitle(taskRequest.getTitle());
        existing.setDescription(taskRequest.getDescription());
        existing.setCompleted(taskRequest.isCompleted());
        existing.setUpdatedAt(LocalDateTime.now());

        return Optional.of(existing);
    }

    public boolean deleteTask(Long id) {
        return tasks.remove(id) != null;
    }
}
