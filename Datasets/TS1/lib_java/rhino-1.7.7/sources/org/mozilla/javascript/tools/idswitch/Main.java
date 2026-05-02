package org.mozilla.javascript.tools.idswitch;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.mozilla.javascript.EvaluatorException;
import org.mozilla.javascript.tools.ToolErrorReporter;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/idswitch/Main.class */
public class Main {
    private static final String SWITCH_TAG_STR = "string_id_map";
    private static final String GENERATED_TAG_STR = "generated";
    private static final String STRING_TAG_STR = "string";
    private static final int NORMAL_LINE = 0;
    private static final int SWITCH_TAG = 1;
    private static final int GENERATED_TAG = 2;
    private static final int STRING_TAG = 3;
    private final List<IdValuePair> all_pairs = new ArrayList();
    private ToolErrorReporter R;
    private CodePrinter P;
    private FileBody body;
    private String source_file;
    private int tag_definition_end;
    private int tag_value_start;
    private int tag_value_end;

    private static boolean is_value_type(int id) {
        return id == 3;
    }

    private static String tag_name(int id) {
        switch (id) {
            case -2:
                return "/generated";
            case -1:
                return "/string_id_map";
            case 0:
            default:
                return "";
            case 1:
                return SWITCH_TAG_STR;
            case 2:
                return GENERATED_TAG_STR;
        }
    }

    void process_file(String file_path) throws IOException {
        InputStream os;
        OutputStream os2;
        this.source_file = file_path;
        this.body = new FileBody();
        if (file_path.equals("-")) {
            os = System.in;
        } else {
            os = new FileInputStream(file_path);
        }
        try {
            Reader r = new InputStreamReader(os2, "ASCII");
            this.body.readData(r);
            os2.close();
            process_file();
            if (this.body.wasModified()) {
                if (file_path.equals("-")) {
                    os2 = System.out;
                } else {
                    os2 = new FileOutputStream(file_path);
                }
                try {
                    Writer w = new OutputStreamWriter(os2);
                    this.body.writeData(w);
                    w.flush();
                    os2.close();
                } finally {
                    os2.close();
                }
            }
        } finally {
            os2.close();
        }
    }

    private void process_file() {
        int cur_state = 0;
        char[] buffer = this.body.getBuffer();
        int generated_begin = -1;
        int generated_end = -1;
        int time_stamp_begin = -1;
        int time_stamp_end = -1;
        this.body.startLineLoop();
        while (this.body.nextLine()) {
            int begin = this.body.getLineBegin();
            int end = this.body.getLineEnd();
            int tag_id = extract_line_tag_id(buffer, begin, end);
            boolean bad_tag = false;
            switch (cur_state) {
                case 0:
                    if (tag_id == 1) {
                        cur_state = 1;
                        this.all_pairs.clear();
                        generated_begin = -1;
                        break;
                    } else if (tag_id == -1) {
                        bad_tag = true;
                        break;
                    }
                    break;
                case 1:
                    if (tag_id == 0) {
                        look_for_id_definitions(buffer, begin, end, false);
                        break;
                    } else if (tag_id == 3) {
                        look_for_id_definitions(buffer, begin, end, true);
                        break;
                    } else if (tag_id == 2) {
                        if (generated_begin < 0) {
                            cur_state = 2;
                            time_stamp_begin = this.tag_definition_end;
                            time_stamp_end = end;
                            break;
                        } else {
                            bad_tag = true;
                            break;
                        }
                    } else if (tag_id == -1) {
                        cur_state = 0;
                        if (generated_begin >= 0 && !this.all_pairs.isEmpty()) {
                            generate_java_code();
                            String code = this.P.toString();
                            boolean different = this.body.setReplacement(generated_begin, generated_end, code);
                            if (different) {
                                String stamp = get_time_stamp();
                                this.body.setReplacement(time_stamp_begin, time_stamp_end, stamp);
                                break;
                            }
                        }
                    } else {
                        bad_tag = true;
                        break;
                    }
                    break;
                case 2:
                    if (tag_id == 0) {
                        if (generated_begin < 0) {
                            generated_begin = begin;
                            break;
                        }
                    } else if (tag_id == -2) {
                        if (generated_begin < 0) {
                            generated_begin = begin;
                        }
                        cur_state = 1;
                        generated_end = begin;
                        break;
                    } else {
                        bad_tag = true;
                        break;
                    }
                    break;
            }
            if (bad_tag) {
                String text = ToolErrorReporter.getMessage("msg.idswitch.bad_tag_order", tag_name(tag_id));
                throw this.R.runtimeError(text, this.source_file, this.body.getLineNumber(), null, 0);
            }
        }
        if (cur_state != 0) {
            String text2 = ToolErrorReporter.getMessage("msg.idswitch.file_end_in_switch", tag_name(cur_state));
            throw this.R.runtimeError(text2, this.source_file, this.body.getLineNumber(), null, 0);
        }
    }

    private String get_time_stamp() {
        SimpleDateFormat f = new SimpleDateFormat(" 'Last update:' yyyy-MM-dd HH:mm:ss z");
        return f.format(new Date());
    }

    private void generate_java_code() {
        this.P.clear();
        IdValuePair[] pairs = new IdValuePair[this.all_pairs.size()];
        this.all_pairs.toArray(pairs);
        SwitchGenerator g = new SwitchGenerator();
        g.char_tail_test_threshold = 2;
        g.setReporter(this.R);
        g.setCodePrinter(this.P);
        g.generateSwitch(pairs, "0");
    }

    private int extract_line_tag_id(char[] array, int cursor, int end) {
        char c;
        char c2;
        int id = 0;
        int cursor2 = skip_white_space(array, cursor, end);
        int cursor3 = look_for_slash_slash(array, cursor2, end);
        if (cursor3 != end) {
            boolean at_line_start = cursor2 + 2 == cursor3;
            int cursor4 = skip_white_space(array, cursor3, end);
            if (cursor4 != end && array[cursor4] == '#') {
                int cursor5 = cursor4 + 1;
                boolean end_tag = false;
                if (cursor5 != end && array[cursor5] == '/') {
                    cursor5++;
                    end_tag = true;
                }
                int tag_start = cursor5;
                while (cursor5 != end && (c2 = array[cursor5]) != '#' && c2 != '=' && !is_white_space(c2)) {
                    cursor5++;
                }
                if (cursor5 != end) {
                    int tag_end = cursor5;
                    int cursor6 = skip_white_space(array, cursor5, end);
                    if (cursor6 != end && ((c = array[cursor6]) == '=' || c == '#')) {
                        id = get_tag_id(array, tag_start, tag_end, at_line_start);
                        if (id != 0) {
                            String bad = null;
                            if (c == '#') {
                                if (end_tag) {
                                    id = -id;
                                    if (is_value_type(id)) {
                                        bad = "msg.idswitch.no_end_usage";
                                    }
                                }
                                this.tag_definition_end = cursor6 + 1;
                            } else {
                                if (end_tag) {
                                    bad = "msg.idswitch.no_end_with_value";
                                } else if (!is_value_type(id)) {
                                    bad = "msg.idswitch.no_value_allowed";
                                }
                                id = extract_tag_value(array, cursor6 + 1, end, id);
                            }
                            if (bad != null) {
                                String s = ToolErrorReporter.getMessage(bad, tag_name(id));
                                throw this.R.runtimeError(s, this.source_file, this.body.getLineNumber(), null, 0);
                            }
                        }
                    }
                }
            }
        }
        return id;
    }

    private int look_for_slash_slash(char[] array, int cursor, int end) {
        while (cursor + 2 <= end) {
            int i = cursor;
            cursor++;
            if (array[i] == '/') {
                cursor++;
                if (array[cursor] == '/') {
                    return cursor;
                }
            }
        }
        return end;
    }

    private int extract_tag_value(char[] array, int cursor, int end, int id) {
        boolean found = false;
        int cursor2 = skip_white_space(array, cursor, end);
        if (cursor2 != end) {
            int value_end = cursor2;
            while (true) {
                if (cursor2 == end) {
                    break;
                }
                char c = array[cursor2];
                if (is_white_space(c)) {
                    int after_space = skip_white_space(array, cursor2 + 1, end);
                    if (after_space != end && array[after_space] == '#') {
                        value_end = cursor2;
                        cursor2 = after_space;
                        break;
                    }
                    cursor2 = after_space + 1;
                } else {
                    if (c == '#') {
                        value_end = cursor2;
                        break;
                    }
                    cursor2++;
                }
            }
            if (cursor2 != end) {
                found = true;
                this.tag_value_start = cursor2;
                this.tag_value_end = value_end;
                this.tag_definition_end = cursor2 + 1;
            }
        }
        if (found) {
            return id;
        }
        return 0;
    }

    private int get_tag_id(char[] array, int begin, int end, boolean at_line_start) {
        if (at_line_start) {
            if (equals(SWITCH_TAG_STR, array, begin, end)) {
                return 1;
            }
            if (equals(GENERATED_TAG_STR, array, begin, end)) {
                return 2;
            }
        }
        if (equals(STRING_TAG_STR, array, begin, end)) {
            return 3;
        }
        return 0;
    }

    private void look_for_id_definitions(char[] array, int begin, int end, boolean use_tag_value_as_string) {
        int cursor;
        int cursor2 = skip_white_space(array, begin, end);
        int name_start = skip_matched_prefix("Id_", array, cursor2, end);
        if (name_start >= 0) {
            int cursor3 = skip_name_char(array, name_start, end);
            int name_end = cursor3;
            if (name_start != name_end && (cursor = skip_white_space(array, cursor3, end)) != end && array[cursor] == '=') {
                if (use_tag_value_as_string) {
                    name_start = this.tag_value_start;
                    name_end = this.tag_value_end;
                }
                add_id(array, cursor2, name_end, name_start, name_end);
            }
        }
    }

    private void add_id(char[] array, int id_start, int id_end, int name_start, int name_end) {
        String name = new String(array, name_start, name_end - name_start);
        String value = new String(array, id_start, id_end - id_start);
        IdValuePair pair = new IdValuePair(name, value);
        pair.setLineNumber(this.body.getLineNumber());
        this.all_pairs.add(pair);
    }

    private static boolean is_white_space(int c) {
        return c == 32 || c == 9;
    }

    private static int skip_white_space(char[] array, int begin, int end) {
        int cursor = begin;
        while (cursor != end && is_white_space(array[cursor])) {
            cursor++;
        }
        return cursor;
    }

    private static int skip_matched_prefix(String prefix, char[] array, int begin, int end) {
        int cursor = -1;
        int prefix_length = prefix.length();
        if (prefix_length <= end - begin) {
            cursor = begin;
            int i = 0;
            while (true) {
                if (i == prefix_length) {
                    break;
                }
                if (prefix.charAt(i) == array[cursor]) {
                    i++;
                    cursor++;
                } else {
                    cursor = -1;
                    break;
                }
            }
        }
        return cursor;
    }

    private static boolean equals(String str, char[] array, int begin, int end) {
        if (str.length() == end - begin) {
            int i = begin;
            int j = 0;
            while (i != end) {
                if (array[i] != str.charAt(j)) {
                    return false;
                }
                i++;
                j++;
            }
            return true;
        }
        return false;
    }

    private static int skip_name_char(char[] array, int begin, int end) {
        char c;
        int cursor = begin;
        while (cursor != end && (('a' <= (c = array[cursor]) && c <= 'z') || (('A' <= c && c <= 'Z') || (('0' <= c && c <= '9') || c == '_')))) {
            cursor++;
        }
        return cursor;
    }

    public static void main(String[] args) {
        Main self = new Main();
        int status = self.exec(args);
        System.exit(status);
    }

    private int exec(String[] args) {
        this.R = new ToolErrorReporter(true, System.err);
        int arg_count = process_options(args);
        if (arg_count == 0) {
            option_error(ToolErrorReporter.getMessage("msg.idswitch.no_file_argument"));
            return -1;
        }
        if (arg_count > 1) {
            option_error(ToolErrorReporter.getMessage("msg.idswitch.too_many_arguments"));
            return -1;
        }
        this.P = new CodePrinter();
        this.P.setIndentStep(4);
        this.P.setIndentTabSize(0);
        try {
            process_file(args[0]);
            return 0;
        } catch (IOException ex) {
            print_error(ToolErrorReporter.getMessage("msg.idswitch.io_error", ex.toString()));
            return -1;
        } catch (EvaluatorException e) {
            return -1;
        }
    }

    private int process_options(String[] args) {
        int status = 1;
        boolean show_usage = false;
        boolean show_version = false;
        int N = args.length;
        int i = 0;
        while (true) {
            if (i != N) {
                String arg = args[i];
                int arg_length = arg.length();
                if (arg_length >= 2 && arg.charAt(0) == '-') {
                    if (arg.charAt(1) == '-') {
                        if (arg_length == 2) {
                            args[i] = null;
                        } else {
                            if (arg.equals("--help")) {
                                show_usage = true;
                            } else if (arg.equals("--version")) {
                                show_version = true;
                            } else {
                                option_error(ToolErrorReporter.getMessage("msg.idswitch.bad_option", arg));
                                status = -1;
                            }
                            args[i] = null;
                        }
                    } else {
                        for (int j = 1; j != arg_length; j++) {
                            char c = arg.charAt(j);
                            switch (c) {
                                case 'h':
                                    show_usage = true;
                                default:
                                    option_error(ToolErrorReporter.getMessage("msg.idswitch.bad_option_char", String.valueOf(c)));
                                    status = -1;
                                    break;
                            }
                        }
                        args[i] = null;
                    }
                }
                i++;
            }
        }
        if (status == 1) {
            if (show_usage) {
                show_usage();
                status = 0;
            }
            if (show_version) {
                show_version();
                status = 0;
            }
        }
        if (status != 1) {
            System.exit(status);
        }
        return remove_nulls(args);
    }

    private void show_usage() {
        System.out.println(ToolErrorReporter.getMessage("msg.idswitch.usage"));
        System.out.println();
    }

    private void show_version() {
        System.out.println(ToolErrorReporter.getMessage("msg.idswitch.version"));
    }

    private void option_error(String str) {
        print_error(ToolErrorReporter.getMessage("msg.idswitch.bad_invocation", str));
    }

    private void print_error(String text) {
        System.err.println(text);
    }

    private int remove_nulls(String[] array) {
        int N = array.length;
        int cursor = 0;
        while (cursor != N && array[cursor] != null) {
            cursor++;
        }
        int destination = cursor;
        if (cursor != N) {
            while (true) {
                cursor++;
                if (cursor == N) {
                    break;
                }
                String elem = array[cursor];
                if (elem != null) {
                    array[destination] = elem;
                    destination++;
                }
            }
        }
        return destination;
    }
}
