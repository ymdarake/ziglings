//
// We were able to get a printable string out of a many-item
// pointer by using a slice to assert a specific length.
//
// But can we ever GO BACK to a sentinel-terminated pointer
// after we've "lost" the sentinel in a coercion?
//
// Yes, we can. Zig's @ptrCast() builtin can do this. Check out
// the signature:
//
//     @ptrCast(value: anytype) anytype
//
// See if you can use it to solve the same many-item pointer
// problem, but without needing a length!
//
const print = @import("std").debug.print;

pub fn main() void {
    // Again, we've coerced the sentinel-terminated string to a
    // many-item pointer, which has no length or sentinel.
    const data: [*]const u8 = "Weird Data!";

    // Please cast 'data' to 'printable':
    const printable: [*:0]const u8 = @ptrCast(data);
    // Now we can print it!
    // Note: this is a little bit naughty, but it works!
    // The @ptrCast() builtin is a little bit like a magic wand
    // that lets you change the type of a pointer without
    // changing the data it points to. It's a powerful tool, but
    // you have to be careful with it. If you use it wrong, you
    // can end up with a pointer that points to the wrong type of
    // data, which can cause all sorts of problems. So use it
    // wisely!

    print("{s}\n", .{printable});
}
