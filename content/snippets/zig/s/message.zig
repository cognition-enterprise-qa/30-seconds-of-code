pub fn getMessage() []const u8 {
    return "Hello, World!";
}

const std = @import("std");

test "message content" {
    try std.testing.expectEqualStrings("Hello, World!", getMessage());
}
