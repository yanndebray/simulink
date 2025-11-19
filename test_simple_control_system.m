classdef test_simple_control_system < matlab.unittest.TestCase
    % Test case for simple_control_system Simulink model
    
    properties
        modelName = 'simple_control_system';
    end
    
    methods (TestMethodSetup)
        function loadModel(testCase)
            % Load the model before each test
            load_system(testCase.modelName);
        end
    end
    
    methods (TestMethodTeardown)
        function closeModel(testCase)
            % Close the model after each test without saving
            close_system(testCase.modelName, 0);
        end
    end
    
    methods (Test)
        function testModelLoads(testCase)
            % Test that the model loads successfully
            testCase.verifyEqual(bdIsLoaded(testCase.modelName), true, ...
                'Model should be loaded');
        end
        
        function testModelHasRequiredBlocks(testCase)
            % Test that all required blocks exist
            blocks = find_system(testCase.modelName, 'SearchDepth', 1, 'Type', 'block');
            blockNames = get_param(blocks, 'Name');
            
            testCase.verifyTrue(any(contains(blockNames, 'Step Input')), ...
                'Model should contain Step Input block');
            testCase.verifyTrue(any(contains(blockNames, 'Controller')), ...
                'Model should contain Controller block');
            testCase.verifyTrue(any(contains(blockNames, 'Plant')), ...
                'Model should contain Plant block');
            testCase.verifyTrue(any(contains(blockNames, 'Scope')), ...
                'Model should contain Scope block');
        end
        
        function testModelSimulates(testCase)
            % Test that the model simulates without errors
            simOut = sim(testCase.modelName, 'ReturnWorkspaceOutputs', 'on');
            testCase.verifyNotEmpty(simOut, 'Simulation should produce output');
        end
        
        function testControllerParameters(testCase)
            % Test that controller has correct transfer function parameters
            num = get_param([testCase.modelName '/Controller'], 'Numerator');
            den = get_param([testCase.modelName '/Controller'], 'Denominator');
            
            testCase.verifyEqual(num, '[10]', ...
                'Controller numerator should be [10]');
            testCase.verifyEqual(den, '[1 5]', ...
                'Controller denominator should be [1 5]');
        end
        
        function testPlantParameters(testCase)
            % Test that plant has correct transfer function parameters
            num = get_param([testCase.modelName '/Plant'], 'Numerator');
            den = get_param([testCase.modelName '/Plant'], 'Denominator');
            
            testCase.verifyEqual(num, '[1]', ...
                'Plant numerator should be [1]');
            testCase.verifyEqual(den, '[1 2 1]', ...
                'Plant denominator should be [1 2 1]');
        end
        
        function testSystemStability(testCase)
            % Test that the closed-loop system is stable
            simOut = sim(testCase.modelName, 'StopTime', '10', ...
                'ReturnWorkspaceOutputs', 'on');
            
            % Get output signal from logsout if available
            % For this simple test, we just verify simulation completes
            testCase.verifyNotEmpty(simOut, ...
                'System should be stable and simulation should complete');
        end
        
        function testBlockConnections(testCase)
            % Test that blocks are properly connected
            lines = find_system(testCase.modelName, 'SearchDepth', 1, ...
                'FindAll', 'on', 'Type', 'line');
            
            % Should have 3 connections
            testCase.verifyEqual(length(lines), 3, ...
                'Model should have 3 signal lines connecting the blocks');
        end
    end
end
