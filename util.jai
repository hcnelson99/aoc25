get_nonempty_lines :: (_text: string) -> []string {
    text := _text;

    result: [..]string;

    found := true;

    while found {
        line: string;
        found, line, text = split_from_left(text, 10);
        if line.count == 0 continue;
        array_add(*result, line);
    }

    return result;
}
