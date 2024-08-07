pragma solidity ^0.8.0;

contract ToDoList {
    uint public taskCount = 0;
    
    struct Task {
        uint id;
        string content;
        bool completed;
        bool deleted;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint id,
        bool completed
    );

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleTaskCompletion(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }

    function deleteTask(uint _id) public {
        Task storage _task =  tasks[_id];
        _task.deleted = true;
    }

    function getListTask() public view returns (uint[] memory) {
        uint[] memory tempTasksIds = new uint[](taskCount);
        uint counter = 0;
        
        for (uint i = 1; i <= taskCount; i++){
            if(!tasks[i].deleted){
                tempTasksIds[counter] = i;
                counter++;
            }
        }

        uint[] memory tasksIds = new uint[](counter);
        for (uint i = 0; i < counter; i++){
            tasksIds[i] = tempTasksIds[i];
        }

        return tasksIds;
    }
}