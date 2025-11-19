# Contributing to Simple Control System

Thank you for your interest in contributing! This document provides guidelines for contributing to this MATLAB/Simulink project.

## 🌟 How to Contribute

We welcome contributions in several forms:

- **Bug reports**: Report issues you encounter
- **Feature requests**: Suggest new features or improvements
- **Code contributions**: Submit pull requests with improvements
- **Documentation**: Improve or expand documentation
- **Examples**: Add new example models or test cases

## 🚀 Getting Started

### Prerequisites

1. **MATLAB Installation**: R2025b or compatible version
2. **Required Toolboxes**:
   - Simulink
   - Control System Toolbox (for analysis features)
   - MATLAB Test (for running unit tests)

### Setting Up Your Development Environment

1. **Fork the repository**
   ```bash
   # Fork via GitHub UI, then clone your fork
   git clone https://github.com/YOUR_USERNAME/guy.git
   cd guy
   ```

2. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Configure MATLAB**
   - Open MATLAB
   - Navigate to the project directory
   - Add the directory to your MATLAB path

## 📝 Contribution Guidelines

### Code Standards

#### MATLAB Code Style

- Use descriptive variable and function names
- Add comprehensive comments and documentation
- Follow MATLAB naming conventions:
  - Functions: `camelCase` (e.g., `calculateResponse`)
  - Variables: `camelCase` (e.g., `transferFunction`)
  - Constants: `UPPER_CASE` (e.g., `MAX_ITERATIONS`)
  - Classes: `PascalCase` (e.g., `ControlSystem`)

#### Simulink Models

- Use clear, descriptive block names
- Organize blocks logically with proper spacing
- Add annotations to explain complex sections
- Use subsystems to organize complex models
- Set appropriate solver settings

### Testing Requirements

All contributions must include tests:

```matlab
classdef test_your_feature < matlab.unittest.TestCase
    methods (Test)
        function testBasicFunctionality(testCase)
            % Your test implementation
            testCase.verifyEqual(actual, expected);
        end
    end
end
```

#### Running Tests Locally

```matlab
% Run all tests
results = runtests('test_simple_control_system.m');

% Run specific test
results = runtests('test_simple_control_system.m', 'Name', 'testModelLoads');

% With coverage
import matlab.unittest.TestRunner
import matlab.unittest.plugins.CodeCoveragePlugin

runner = TestRunner.withTextOutput;
runner.addPlugin(CodeCoveragePlugin.forFolder(pwd));
results = runner.run(testsuite('test_simple_control_system.m'));
```

### Documentation Standards

- Update README.md if adding new features
- Add help text to all functions:

```matlab
function result = myFunction(input)
%MYFUNCTION Brief description
%   RESULT = MYFUNCTION(INPUT) detailed description
%
%   Example:
%       result = myFunction(5);
%
%   See also: relatedFunction

    % Implementation
end
```

- Update Live Script examples when adding features

## 🔄 Pull Request Process

### Before Submitting

1. **Run all tests**
   ```matlab
   runtests('test_simple_control_system.m')
   ```

2. **Check code quality**
   ```matlab
   checkcode('your_file.m', '-struct')
   ```

3. **Update documentation**
   - Add docstrings to new functions
   - Update README.md if needed
   - Create/update examples

4. **Commit with clear messages**
   ```bash
   git add .
   git commit -m "feat: add new controller design feature"
   ```

### Commit Message Convention

Follow conventional commits format:

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `test:` Adding or updating tests
- `refactor:` Code refactoring
- `style:` Formatting changes
- `chore:` Maintenance tasks

Examples:
```bash
git commit -m "feat: add PID controller block"
git commit -m "fix: correct transfer function coefficients"
git commit -m "docs: update installation instructions"
git commit -m "test: add stability verification tests"
```

### Submitting Pull Request

1. **Push your branch**
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create Pull Request** on GitHub with:
   - Clear title describing the change
   - Detailed description of what and why
   - Reference to any related issues
   - Screenshots (if UI changes)

3. **PR Description Template**:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement

## Testing
- [ ] All existing tests pass
- [ ] Added new tests for new functionality
- [ ] Tested on MATLAB R2025b

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-reviewed code
- [ ] Added comments for complex sections
- [ ] Updated documentation
- [ ] No new warnings from checkcode

## Related Issues
Closes #(issue number)
```

## 🐛 Reporting Bugs

### Before Reporting

1. Check existing issues
2. Verify you're using supported MATLAB version
3. Try to reproduce with minimal example

### Bug Report Template

```markdown
**MATLAB Version**: R2025b

**Description**
Clear description of the bug

**To Reproduce**
Steps to reproduce:
1. Open model
2. Run simulation
3. Observe error

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Error Messages**
```
Paste error message here
```

**Screenshots**
If applicable
```

## 💡 Suggesting Features

We welcome feature suggestions! Please provide:

1. **Use case**: Why is this feature needed?
2. **Proposed solution**: How should it work?
3. **Alternatives**: Other approaches considered
4. **Additional context**: Examples, mockups, references

## 📚 Resources

### MATLAB/Simulink Documentation

- [MATLAB Documentation](https://www.mathworks.com/help/matlab/)
- [Simulink Documentation](https://www.mathworks.com/help/simulink/)
- [MATLAB Coding Style](https://www.mathworks.com/matlabcentral/fileexchange/46056-matlab-style-guidelines-2-0)
- [MATLAB Unit Testing](https://www.mathworks.com/help/matlab/matlab-unit-test-framework.html)

### Project-Specific

- [Control System Toolbox](https://www.mathworks.com/help/control/)
- [GitHub Actions for MATLAB](https://github.com/matlab-actions)
- [Simulink Best Practices](https://www.mathworks.com/help/simulink/modeling-guidelines.html)

## 🤝 Code of Conduct

### Our Standards

- Be respectful and inclusive
- Welcome diverse perspectives
- Accept constructive criticism
- Focus on what's best for the community
- Show empathy towards others

### Enforcement

Project maintainers are responsible for clarifying standards and will take appropriate action in response to unacceptable behavior.

## ❓ Questions?

- **General questions**: Open a GitHub Discussion
- **Bug reports**: Open an Issue
- **Security concerns**: Email maintainers directly
- **Feature requests**: Open an Issue with "enhancement" label

## 🏆 Recognition

Contributors will be:
- Listed in project acknowledgments
- Credited in release notes
- Added to CONTRIBUTORS.md (coming soon)

## 📋 Review Process

1. **Initial Review**: Maintainers check basic requirements
2. **Technical Review**: Code quality and functionality check
3. **Testing**: CI/CD pipeline runs automatically
4. **Feedback**: Maintainers provide comments/suggestions
5. **Approval**: Once approved, changes are merged

Expected review time: 2-7 days

## 🎯 Priority Areas

Current focus areas where contributions are especially welcome:

- [ ] Additional control strategies (PID, LQR, MPC)
- [ ] Parameter optimization examples
- [ ] Frequency domain analysis tools
- [ ] Interactive apps for parameter tuning
- [ ] More comprehensive test coverage
- [ ] Performance benchmarking
- [ ] Documentation improvements

---

Thank you for contributing to make this project better! 🚀

For more information, see the [main README](README.md).
