const std = @import("std");

const day1 = @import("day1.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    std.debug.print("Day 1 solution: {d}\n", .{try day1.solution(allocator)});
}

test "Day 1 solution test" {
    try std.testing.expectEqual(day1.solution(std.testing.allocator), 1590491);
}
