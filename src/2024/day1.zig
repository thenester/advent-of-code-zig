const std = @import("std");

const input = @embedFile("input/day1.txt");

pub fn solution(parent_allocator: std.mem.Allocator) !u32 {
    var file_iter = std.mem.tokenizeScalar(u8, input, '\n');
    var result: u32 = 0;

    var left_list = try std.ArrayList(u32).initCapacity(parent_allocator, 100);
    defer left_list.deinit();

    var right_list = try std.ArrayList(u32).initCapacity(parent_allocator, 100);
    defer right_list.deinit();

    while (file_iter.next()) |token| {
        var line_iter = std.mem.tokenizeScalar(u8, token, ' ');
        try left_list.append(try std.fmt.parseInt(u32, line_iter.next().?, 10));
        try right_list.append(try std.fmt.parseInt(u32, line_iter.next().?, 10));
    }

    std.mem.sort(u32, left_list.items, {}, std.sort.asc(u32));
    std.mem.sort(u32, right_list.items, {}, std.sort.asc(u32));

    for (left_list.items, 0..) |element, idx| {
        if (element > right_list.items[idx]) {
            result += element - right_list.items[idx];
        } else {
            result += right_list.items[idx] - element;
        }
    }

    return result;
}
