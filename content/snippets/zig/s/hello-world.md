---
title: Hello World in Zig following SOLID principles
shortTitle: Hello World
language: zig
tags: [function,beginner]
cover: digital-nomad-2
excerpt: Learn how to implement a Hello World program in Zig that follows SOLID principles by separating concerns across multiple modules.
listed: true
dateModified: 2025-07-16
---

This Hello World implementation demonstrates how to apply SOLID principles in Zig, specifically the **Single Responsibility Principle (SRP)**, by separating concerns across different modules. Each module has a single, well-defined responsibility.

## Implementation

The implementation consists of three modules, each with a distinct responsibility:

### Message Module (`message.zig`)

Responsible for providing the message content:

```zig
pub fn getMessage() []const u8 {
    return "Hello, World!";
}
```

### Output Module (`output.zig`)

Responsible for handling I/O operations:

```zig
const std = @import("std");
const message = @import("message.zig");

pub fn printMessage() !void {
    try std.io.getStdOut().writer().print("{s}\n", .{message.getMessage()});
}
```

### Main Entry Point (`main.zig`)

Responsible for program orchestration:

```zig
const output = @import("output.zig");

pub fn main() !void {
    try output.printMessage();
}
```

## Tests

The implementation includes native Zig tests using the built-in testing framework:

```zig
const std = @import("std");
const message = @import("message.zig");

test "message content" {
    try std.testing.expectEqualStrings("Hello, World!", message.getMessage());
}
```

## SOLID Principles Applied

This implementation follows the **Single Responsibility Principle (SRP)** by ensuring each module has only one reason to change:

- **Message module**: Changes only if the message content needs to be modified
- **Output module**: Changes only if the output method or formatting needs to be modified  
- **Main module**: Changes only if the program flow or orchestration needs to be modified

This separation of concerns makes the code more maintainable, testable, and flexible. For example, you could easily switch from console output to file output by only modifying the output module, or change the message without affecting the I/O logic.

## Usage

To run the program:

```bash
# Compile and run
zig run main.zig

# Or compile to executable
zig build-exe main.zig
./main
```

To run the tests:

```bash
# Run all tests
zig test message.zig

# Run tests with verbose output
zig test message.zig --verbose
```

The program will output:
```
Hello, World!
```

## Key Zig Features Demonstrated

- **Module system**: Using `@import()` to organize code across files
- **Error handling**: Using `!void` return type and `try` keyword
- **Public functions**: Using `pub` keyword to expose module interfaces
- **Built-in testing**: Using `std.testing` framework for unit tests
- **String literals**: Working with `[]const u8` string type
- **Standard I/O**: Using `std.io.getStdOut().writer()` for output
