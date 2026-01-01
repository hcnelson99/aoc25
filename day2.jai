
part1 :: (_text : string) {
    text := _text;

    total := 0;

    while true {
        found : bool;
        range_s : string;

        found, range_s, text = split_from_left(text, #char ",");

        if !found break;

        range := split(range_s, "-");
        
        start := string_to_int(range[0]);
        end := string_to_int(range[1]);


        for num: start..end {
            s := sprint("%", num);

            if s.count % 2 != 0 continue;

            half_len := s.count / 2;
            for 0..half_len-1 {
                if s[it] != s[it+half_len] continue num;
            }

            total += num;
        }
    }

    print("%\n", total);
}


// 1011
// subsequence_length = 2
// repetition_count = 2
// i=0
// first = "1"
// j = 1
// s[1*2+0]

// 2121212121

// 1*2+0

part2_invalid :: (n : int) -> bool {
    s := sprint("%", n);

    for subsequence_length: 1..s.count-1 {
        if s.count % subsequence_length != 0 continue;
        repetition_count := s.count / subsequence_length;

        // print("% %\n", subsequence_length, repetition_count);

        for i: 0..subsequence_length-1 {
            first := s[i];
            for j: 1..repetition_count-1 {
                if first != s[j*subsequence_length+i] {
                    // print("first %\n",  cast(string)u8.[first]  );
                    // print("continue % %\n", i, j);
                    continue subsequence_length;
                }
            }
        }
        // print("returning true! % %\n", subsequence_length, repetition_count);
        return true;
    }

    return false;
}

part2 :: (_text : string) {
    text := _text;

    total := 0;

    found := true;

    while found {
        range_s : string;

        found, range_s, text = split_from_left(text, #char ",");

        range := split(range_s, "-");
        
        start := string_to_int(range[0]);
        end := string_to_int(range[1]);

        for num: start..end {
            if part2_invalid(num) {
                total += num;
            }
        }
    }

    print("%\n", formatInt(total, digits_per_comma=3, comma_string =","));
}


main :: () {
    // part2_invalid(1011);

    // print("invalid %\n", part2_invalid(2121212121));
    // part1(example_input);
    // part1(full_input);
    // part2(example_input);
    part2(full_input);
}

// #run main();

example_input :: "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124";


full_input :: "1-14,46452718-46482242,16-35,92506028-92574540,1515128146-1515174322,56453-79759,74-94,798-971,49-66,601-752,3428-4981,511505-565011,421819-510058,877942-901121,39978-50500,9494916094-9494978970,7432846301-7432888696,204-252,908772-990423,21425-25165,1030-1285,7685-9644,419-568,474396757-474518094,5252506279-5252546898,4399342-4505058,311262290-311393585,1895-2772,110695-150992,567521-773338,277531-375437,284-364,217936-270837,3365257-3426031,29828-36350";

#import "Basic";
#import "String";

