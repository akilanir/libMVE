package com.mikepenz.octicons_typeface_library;

import android.content.Context;
import android.graphics.Typeface;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.iconics.typeface.ITypeface;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;

/* loaded from: com.mikepenz.octicons-typeface.3.0.0.1.jar:com/mikepenz/octicons_typeface_library/Octicons.class */
public class Octicons implements ITypeface {
    private static final String TTF_FILE = "octicons.ttf";
    private static Typeface typeface = null;
    private static HashMap<String, Character> mChars;

    public IIcon getIcon(String key) {
        return Icon.valueOf(key);
    }

    public HashMap<String, Character> getCharacters() {
        if (mChars == null) {
            HashMap<String, Character> aChars = new HashMap<>();
            for (Icon v : Icon.values()) {
                aChars.put(v.name(), Character.valueOf(v.character));
            }
            mChars = aChars;
        }
        return mChars;
    }

    public String getMappingPrefix() {
        return "oct";
    }

    public String getFontName() {
        return "Octicons";
    }

    public String getVersion() {
        return "3.0.1";
    }

    public int getIconCount() {
        return mChars.size();
    }

    public Collection<String> getIcons() {
        Collection<String> icons = new LinkedList<>();
        for (Icon value : Icon.values()) {
            icons.add(value.name());
        }
        return icons;
    }

    public String getAuthor() {
        return "GitHub";
    }

    public String getUrl() {
        return "https://github.com/github/octicons";
    }

    public String getDescription() {
        return "GitHub's icon font https://octicons.github.com/";
    }

    public String getLicense() {
        return " SIL OFL 1.1";
    }

    public String getLicenseUrl() {
        return "http://scripts.sil.org/OFL";
    }

    public Typeface getTypeface(Context context) {
        if (typeface == null) {
            try {
                typeface = Typeface.createFromAsset(context.getAssets(), "fonts/octicons.ttf");
            } catch (Exception e) {
                return null;
            }
        }
        return typeface;
    }

    /* loaded from: com.mikepenz.octicons-typeface.3.0.0.1.jar:com/mikepenz/octicons_typeface_library/Octicons$Icon.class */
    public enum Icon implements IIcon {
        oct_alert(61485),
        oct_arrow_down(61503),
        oct_arrow_left(61504),
        oct_arrow_right(61502),
        oct_arrow_small_down(61600),
        oct_arrow_small_left(61601),
        oct_arrow_small_right(61553),
        oct_arrow_small_up(61599),
        oct_arrow_up(61501),
        oct_microscope(61661),
        oct_beaker(61661),
        oct_bell(61662),
        oct_book(61447),
        oct_bookmark(61563),
        oct_briefcase(61651),
        oct_broadcast(61512),
        oct_browser(61637),
        oct_bug(61585),
        oct_calendar(61544),
        oct_check(61498),
        oct_checklist(61558),
        oct_chevron_down(61603),
        oct_chevron_left(61604),
        oct_chevron_right(61560),
        oct_chevron_up(61602),
        oct_circle_slash(61572),
        oct_circuit_board(61654),
        oct_clippy(61493),
        oct_clock(61510),
        oct_cloud_download(61451),
        oct_cloud_upload(61452),
        oct_code(61535),
        oct_color_mode(61541),
        oct_comment_add(61483),
        oct_comment(61483),
        oct_comment_discussion(61519),
        oct_credit_card(61509),
        oct_dash(61642),
        oct_dashboard(61565),
        oct_database(61590),
        oct_clone(61660),
        oct_desktop_download(61660),
        oct_device_camera(61526),
        oct_device_camera_video(61527),
        oct_device_desktop(62076),
        oct_device_mobile(61496),
        oct_diff(61517),
        oct_diff_added(61547),
        oct_diff_ignored(61593),
        oct_diff_modified(61549),
        oct_diff_removed(61548),
        oct_diff_renamed(61550),
        oct_ellipsis(61594),
        oct_eye_unwatch(61518),
        oct_eye_watch(61518),
        oct_eye(61518),
        oct_file_binary(61588),
        oct_file_code(61456),
        oct_file_directory(61462),
        oct_file_media(61458),
        oct_file_pdf(61460),
        oct_file_submodule(61463),
        oct_file_symlink_directory(61617),
        oct_file_symlink_file(61616),
        oct_file_text(61457),
        oct_file_zip(61459),
        oct_flame(61650),
        oct_fold(61644),
        oct_gear(61487),
        oct_gift(61506),
        oct_gist(61454),
        oct_gist_secret(61580),
        oct_git_branch_create(61472),
        oct_git_branch_delete(61472),
        oct_git_branch(61472),
        oct_git_commit(61471),
        oct_git_compare(61612),
        oct_git_merge(61475),
        oct_git_pull_request_abandoned(61449),
        oct_git_pull_request(61449),
        oct_globe(61622),
        oct_graph(61507),
        oct_heart(9829),
        oct_history(61566),
        oct_home(61581),
        oct_horizontal_rule(61552),
        oct_hubot(61597),
        oct_inbox(61647),
        oct_info(61529),
        oct_issue_closed(61480),
        oct_issue_opened(61478),
        oct_issue_reopened(61479),
        oct_jersey(61465),
        oct_key(61513),
        oct_keyboard(61453),
        oct_law(61656),
        oct_light_bulb(61440),
        oct_link(61532),
        oct_link_external(61567),
        oct_list_ordered(61538),
        oct_list_unordered(61537),
        oct_location(61536),
        oct_gist_private(61546),
        oct_mirror_private(61546),
        oct_git_fork_private(61546),
        oct_lock(61546),
        oct_logo_github(61586),
        oct_mail(61499),
        oct_mail_read(61500),
        oct_mail_reply(61521),
        oct_mark_github(61450),
        oct_markdown(61641),
        oct_megaphone(61559),
        oct_mention(61630),
        oct_milestone(61557),
        oct_mirror_public(61476),
        oct_mirror(61476),
        oct_mortar_board(61655),
        oct_mute(61568),
        oct_no_newline(61596),
        oct_octoface(61448),
        oct_organization(61495),
        oct_package(61636),
        oct_paintcan(61649),
        oct_pencil(61528),
        oct_person_add(61464),
        oct_person_follow(61464),
        oct_person(61464),
        oct_pin(61505),
        oct_plug(61652),
        oct_repo_create(61533),
        oct_gist_new(61533),
        oct_file_directory_create(61533),
        oct_file_add(61533),
        oct_plus(61533),
        oct_primitive_dot(61522),
        oct_primitive_square(61523),
        oct_pulse(61573),
        oct_question(61484),
        oct_quote(61539),
        oct_radio_tower(61488),
        oct_repo_delete(61441),
        oct_repo(61441),
        oct_repo_clone(61516),
        oct_repo_force_push(61514),
        oct_gist_fork(61442),
        oct_repo_forked(61442),
        oct_repo_pull(61446),
        oct_repo_push(61445),
        oct_rocket(61491),
        oct_rss(61492),
        oct_ruby(61511),
        oct_screen_full(61542),
        oct_screen_normal(61543),
        oct_search_save(61486),
        oct_search(61486),
        oct_server(61591),
        oct_settings(61564),
        oct_log_in(61494),
        oct_sign_in(61494),
        oct_log_out(61490),
        oct_sign_out(61490),
        oct_squirrel(61618),
        oct_star_add(61482),
        oct_star_delete(61482),
        oct_star(61482),
        oct_stop(61583),
        oct_repo_sync(61575),
        oct_sync(61575),
        oct_tag_remove(61461),
        oct_tag_add(61461),
        oct_tag(61461),
        oct_telescope(61576),
        oct_terminal(61640),
        oct_three_bars(61534),
        oct_thumbsdown(61659),
        oct_thumbsup(61658),
        oct_tools(61489),
        oct_trashcan(61648),
        oct_triangle_down(61531),
        oct_triangle_left(61508),
        oct_triangle_right(61530),
        oct_triangle_up(61610),
        oct_unfold(61497),
        oct_unmute(61626),
        oct_versions(61540),
        oct_watch(61664),
        oct_remove_close(61569),
        oct_x(61569),
        oct_zap(9889);

        char character;
        private static ITypeface typeface;

        Icon(char character) {
            this.character = character;
        }

        public String getFormattedName() {
            return "{" + name() + "}";
        }

        public char getCharacter() {
            return this.character;
        }

        public String getName() {
            return name();
        }

        public ITypeface getTypeface() {
            if (typeface == null) {
                typeface = new Octicons();
            }
            return typeface;
        }
    }
}
