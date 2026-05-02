package com.github.paolorotolo.appintro;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/AppIntroFragment.class */
public class AppIntroFragment extends Fragment {
    private static final String ARG_TITLE = "title";
    private static final String ARG_DESC = "desc";
    private static final String ARG_DRAWABLE = "drawable";
    private static final String ARG_COLOUR = "colour";
    private int drawable;
    private int colour;
    private String title;
    private String description;

    public static AppIntroFragment newInstance(String title, String description, int imageDrawable, int colour) {
        AppIntroFragment sampleSlide = new AppIntroFragment();
        Bundle args = new Bundle();
        args.putString(ARG_TITLE, title);
        args.putString(ARG_DESC, description);
        args.putInt(ARG_DRAWABLE, imageDrawable);
        args.putInt(ARG_COLOUR, colour);
        sampleSlide.setArguments(args);
        return sampleSlide;
    }

    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null && getArguments().size() != 0) {
            this.drawable = getArguments().getInt(ARG_DRAWABLE);
            this.title = getArguments().getString(ARG_TITLE);
            this.description = getArguments().getString(ARG_DESC);
            this.colour = getArguments().getInt(ARG_COLOUR);
        }
    }

    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.fragment_intro, container, false);
        TextView t = (TextView) v.findViewById(R.id.title);
        TextView d = (TextView) v.findViewById(R.id.description);
        ImageView i = (ImageView) v.findViewById(R.id.image);
        LinearLayout m = (LinearLayout) v.findViewById(R.id.main);
        t.setText(this.title);
        d.setText(this.description);
        i.setImageDrawable(ResourceUtils.getDrawable(getActivity(), this.drawable));
        m.setBackgroundColor(this.colour);
        return v;
    }
}
