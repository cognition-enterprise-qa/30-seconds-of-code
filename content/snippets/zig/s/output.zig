const std = @import("std");
const message = @import("message.zig");

pub fn printMessage() !void {
    try std.io.getStdOut().writer().print("{s}\n", .{message.getMessage()});
}
