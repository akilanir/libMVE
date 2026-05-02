package com.mikepenz.aboutlibraries.ui.adapter;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.CardView;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.aboutlibraries.BuildConfig;
import com.mikepenz.aboutlibraries.Libs;
import com.mikepenz.aboutlibraries.LibsBuilder;
import com.mikepenz.aboutlibraries.LibsConfiguration;
import com.mikepenz.aboutlibraries.R;
import com.mikepenz.aboutlibraries.entity.Library;
import com.mikepenz.aboutlibraries.util.MovementCheck;
import com.mikepenz.aboutlibraries.util.RippleForegroundListener;
import com.mikepenz.aboutlibraries.util.UIUtils;
import java.util.LinkedList;
import java.util.List;

/* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter.class */
public class LibsRecyclerViewAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private static final int TYPE_HEADER = 0;
    private static final int TYPE_ITEM = 1;
    private RippleForegroundListener rippleForegroundListener = new RippleForegroundListener(R.id.rippleForegroundListenerView);
    private List<Library> libs = new LinkedList();
    private boolean header = false;
    private LibsBuilder libsBuilder;
    private Integer aboutVersionCode;
    private String aboutVersionName;
    private Drawable aboutIcon;

    public LibsRecyclerViewAdapter(LibsBuilder libsBuilder) {
        this.libsBuilder = null;
        this.libsBuilder = libsBuilder;
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        if (viewType == 0) {
            View v = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.listheader_opensource, viewGroup, false);
            return new HeaderViewHolder(v);
        }
        View v2 = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.listitem_opensource, viewGroup, false);
        return new ViewHolder(v2);
    }

    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int position) {
        final Context ctx = viewHolder.itemView.getContext();
        if (viewHolder instanceof HeaderViewHolder) {
            HeaderViewHolder holder = (HeaderViewHolder) viewHolder;
            if (this.libsBuilder.aboutShowIcon.booleanValue() && this.aboutIcon != null) {
                holder.aboutIcon.setImageDrawable(this.aboutIcon);
                holder.aboutIcon.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        if (LibsConfiguration.getInstance().getListener() != null) {
                            LibsConfiguration.getInstance().getListener().onIconClicked(v);
                        }
                    }
                });
                holder.aboutIcon.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.2
                    @Override // android.view.View.OnLongClickListener
                    public boolean onLongClick(View v) {
                        return LibsConfiguration.getInstance().getListener() != null && LibsConfiguration.getInstance().getListener().onIconLongClicked(v);
                    }
                });
            } else {
                holder.aboutIcon.setVisibility(8);
            }
            if (!TextUtils.isEmpty(this.libsBuilder.aboutAppName)) {
                holder.aboutAppName.setText(this.libsBuilder.aboutAppName);
            } else {
                holder.aboutAppName.setVisibility(8);
            }
            holder.aboutSpecialContainer.setVisibility(8);
            holder.aboutSpecial1.setVisibility(8);
            holder.aboutSpecial2.setVisibility(8);
            holder.aboutSpecial3.setVisibility(8);
            if (!TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial1) && !TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial1Description)) {
                holder.aboutSpecial1.setText(this.libsBuilder.aboutAppSpecial1);
                holder.aboutSpecial1.setVisibility(0);
                holder.aboutSpecial1.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.3
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        boolean consumed = false;
                        if (LibsConfiguration.getInstance().getListener() != null) {
                            consumed = LibsConfiguration.getInstance().getListener().onExtraClicked(v, Libs.SpecialButton.SPECIAL1);
                        }
                        if (!consumed) {
                            try {
                                AlertDialog.Builder alert = new AlertDialog.Builder(ctx);
                                alert.setMessage(Html.fromHtml(LibsRecyclerViewAdapter.this.libsBuilder.aboutAppSpecial1Description));
                                alert.create().show();
                            } catch (Exception e) {
                            }
                        }
                    }
                });
                holder.aboutSpecialContainer.setVisibility(0);
            }
            if (!TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial2) && !TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial2Description)) {
                holder.aboutSpecial2.setText(this.libsBuilder.aboutAppSpecial2);
                holder.aboutSpecial2.setVisibility(0);
                holder.aboutSpecial2.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.4
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        boolean consumed = false;
                        if (LibsConfiguration.getInstance().getListener() != null) {
                            consumed = LibsConfiguration.getInstance().getListener().onExtraClicked(v, Libs.SpecialButton.SPECIAL2);
                        }
                        if (!consumed) {
                            try {
                                AlertDialog.Builder alert = new AlertDialog.Builder(ctx);
                                alert.setMessage(Html.fromHtml(LibsRecyclerViewAdapter.this.libsBuilder.aboutAppSpecial2Description));
                                alert.create().show();
                            } catch (Exception e) {
                            }
                        }
                    }
                });
                holder.aboutSpecialContainer.setVisibility(0);
            }
            if (!TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial3) && !TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial3Description)) {
                holder.aboutSpecial3.setText(this.libsBuilder.aboutAppSpecial3);
                holder.aboutSpecial3.setVisibility(0);
                holder.aboutSpecial3.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.5
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        boolean consumed = false;
                        if (LibsConfiguration.getInstance().getListener() != null) {
                            consumed = LibsConfiguration.getInstance().getListener().onExtraClicked(v, Libs.SpecialButton.SPECIAL3);
                        }
                        if (!consumed) {
                            try {
                                AlertDialog.Builder alert = new AlertDialog.Builder(ctx);
                                alert.setMessage(Html.fromHtml(LibsRecyclerViewAdapter.this.libsBuilder.aboutAppSpecial3Description));
                                alert.create().show();
                            } catch (Exception e) {
                            }
                        }
                    }
                });
                holder.aboutSpecialContainer.setVisibility(0);
            }
            if (this.libsBuilder.aboutShowVersion != null && this.libsBuilder.aboutShowVersion.booleanValue()) {
                holder.aboutVersion.setText(ctx.getString(R.string.version) + " " + this.aboutVersionName + " (" + this.aboutVersionCode + ")");
            } else if (this.libsBuilder.aboutShowVersionName != null && this.libsBuilder.aboutShowVersionName.booleanValue()) {
                holder.aboutVersion.setText(ctx.getString(R.string.version) + " " + this.aboutVersionName);
            } else if (this.libsBuilder.aboutShowVersionCode != null && this.libsBuilder.aboutShowVersionCode.booleanValue()) {
                holder.aboutVersion.setText(ctx.getString(R.string.version) + " " + this.aboutVersionCode);
            } else {
                holder.aboutVersion.setVisibility(8);
            }
            if (!TextUtils.isEmpty(this.libsBuilder.aboutDescription)) {
                holder.aboutAppDescription.setText(Html.fromHtml(this.libsBuilder.aboutDescription));
                holder.aboutAppDescription.setMovementMethod(MovementCheck.getInstance());
            } else {
                holder.aboutAppDescription.setVisibility(8);
            }
            if ((!this.libsBuilder.aboutShowIcon.booleanValue() && !this.libsBuilder.aboutShowVersion.booleanValue()) || TextUtils.isEmpty(this.libsBuilder.aboutDescription)) {
                holder.aboutDivider.setVisibility(8);
                return;
            }
            return;
        }
        if (viewHolder instanceof ViewHolder) {
            ViewHolder holder2 = (ViewHolder) viewHolder;
            final Library library = getItem(position);
            holder2.libraryName.setText(library.getLibraryName());
            holder2.libraryCreator.setText(library.getAuthor());
            if (TextUtils.isEmpty(library.getLibraryDescription())) {
                holder2.libraryDescription.setText(library.getLibraryDescription());
            } else {
                holder2.libraryDescription.setText(Html.fromHtml(library.getLibraryDescription()));
            }
            if ((TextUtils.isEmpty(library.getLibraryVersion()) && library.getLicense() != null && TextUtils.isEmpty(library.getLicense().getLicenseName())) || (!this.libsBuilder.showVersion.booleanValue() && !this.libsBuilder.showLicense.booleanValue())) {
                holder2.libraryBottomDivider.setVisibility(8);
                holder2.libraryBottomContainer.setVisibility(8);
            } else {
                holder2.libraryBottomDivider.setVisibility(0);
                holder2.libraryBottomContainer.setVisibility(0);
                if (!TextUtils.isEmpty(library.getLibraryVersion()) && this.libsBuilder.showVersion.booleanValue()) {
                    holder2.libraryVersion.setText(library.getLibraryVersion());
                } else {
                    holder2.libraryVersion.setText(BuildConfig.FLAVOR);
                }
                if (library.getLicense() != null && !TextUtils.isEmpty(library.getLicense().getLicenseName()) && this.libsBuilder.showLicense.booleanValue()) {
                    holder2.libraryLicense.setText(library.getLicense().getLicenseName());
                } else {
                    holder2.libraryLicense.setText(BuildConfig.FLAVOR);
                }
            }
            if (!TextUtils.isEmpty(library.getAuthorWebsite())) {
                holder2.libraryCreator.setOnTouchListener(this.rippleForegroundListener);
                holder2.libraryCreator.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.6
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                        boolean consumed = false;
                        if (LibsConfiguration.getInstance().getListener() != null) {
                            consumed = LibsConfiguration.getInstance().getListener().onLibraryAuthorClicked(view, library);
                        }
                        if (!consumed) {
                            LibsRecyclerViewAdapter.this.openAuthorWebsite(ctx, library.getAuthorWebsite());
                        }
                    }
                });
                holder2.libraryCreator.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.7
                    @Override // android.view.View.OnLongClickListener
                    public boolean onLongClick(View v) {
                        boolean consumed = false;
                        if (LibsConfiguration.getInstance().getListener() != null) {
                            consumed = LibsConfiguration.getInstance().getListener().onLibraryAuthorLongClicked(v, library);
                        }
                        if (!consumed) {
                            LibsRecyclerViewAdapter.this.openAuthorWebsite(ctx, library.getAuthorWebsite());
                            consumed = LibsRecyclerViewAdapter.TYPE_ITEM;
                        }
                        return consumed;
                    }
                });
            } else {
                holder2.libraryCreator.setOnTouchListener(null);
                holder2.libraryCreator.setOnClickListener(null);
                holder2.libraryCreator.setOnLongClickListener(null);
            }
            if (!TextUtils.isEmpty(library.getLibraryWebsite()) || !TextUtils.isEmpty(library.getRepositoryLink())) {
                holder2.libraryDescription.setOnTouchListener(this.rippleForegroundListener);
                holder2.libraryDescription.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.8
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        boolean consumed = false;
                        if (LibsConfiguration.getInstance().getListener() != null) {
                            consumed = LibsConfiguration.getInstance().getListener().onLibraryContentClicked(v, library);
                        }
                        if (!consumed) {
                            LibsRecyclerViewAdapter.this.openLibraryWebsite(ctx, library.getLibraryWebsite() != null ? library.getLibraryWebsite() : library.getRepositoryLink());
                        }
                    }
                });
                holder2.libraryDescription.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.9
                    @Override // android.view.View.OnLongClickListener
                    public boolean onLongClick(View v) {
                        boolean consumed = false;
                        if (LibsConfiguration.getInstance().getListener() != null) {
                            consumed = LibsConfiguration.getInstance().getListener().onLibraryContentLongClicked(v, library);
                        }
                        if (!consumed) {
                            LibsRecyclerViewAdapter.this.openLibraryWebsite(ctx, library.getLibraryWebsite() != null ? library.getLibraryWebsite() : library.getRepositoryLink());
                            consumed = LibsRecyclerViewAdapter.TYPE_ITEM;
                        }
                        return consumed;
                    }
                });
            } else {
                holder2.libraryDescription.setOnTouchListener(null);
                holder2.libraryDescription.setOnClickListener(null);
                holder2.libraryDescription.setOnLongClickListener(null);
            }
            if (library.getLicense() != null && !TextUtils.isEmpty(library.getLicense().getLicenseWebsite())) {
                holder2.libraryBottomContainer.setOnTouchListener(this.rippleForegroundListener);
                holder2.libraryBottomContainer.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.10
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                        boolean consumed = false;
                        if (LibsConfiguration.getInstance().getListener() != null) {
                            consumed = LibsConfiguration.getInstance().getListener().onLibraryBottomClicked(view, library);
                        }
                        if (!consumed) {
                            LibsRecyclerViewAdapter.this.openLicense(ctx, LibsRecyclerViewAdapter.this.libsBuilder, library);
                        }
                    }
                });
                holder2.libraryBottomContainer.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter.11
                    @Override // android.view.View.OnLongClickListener
                    public boolean onLongClick(View v) {
                        boolean consumed = false;
                        if (LibsConfiguration.getInstance().getListener() != null) {
                            consumed = LibsConfiguration.getInstance().getListener().onLibraryBottomLongClicked(v, library);
                        }
                        if (!consumed) {
                            LibsRecyclerViewAdapter.this.openLicense(ctx, LibsRecyclerViewAdapter.this.libsBuilder, library);
                            consumed = LibsRecyclerViewAdapter.TYPE_ITEM;
                        }
                        return consumed;
                    }
                });
            } else {
                holder2.libraryBottomContainer.setOnTouchListener(null);
                holder2.libraryBottomContainer.setOnClickListener(null);
                holder2.libraryBottomContainer.setOnLongClickListener(null);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openAuthorWebsite(Context ctx, String authorWebsite) {
        try {
            Intent browserIntent = new Intent("android.intent.action.VIEW", Uri.parse(authorWebsite));
            ctx.startActivity(browserIntent);
        } catch (Exception e) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openLibraryWebsite(Context ctx, String libraryWebsite) {
        try {
            Intent browserIntent = new Intent("android.intent.action.VIEW", Uri.parse(libraryWebsite));
            ctx.startActivity(browserIntent);
        } catch (Exception e) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openLicense(Context ctx, LibsBuilder libsBuilder, Library library) {
        try {
            if (libsBuilder.showLicenseDialog.booleanValue() && !TextUtils.isEmpty(library.getLicense().getLicenseDescription())) {
                AlertDialog.Builder builder = new AlertDialog.Builder(ctx);
                builder.setMessage(Html.fromHtml(library.getLicense().getLicenseDescription()));
                builder.create().show();
            } else {
                Intent browserIntent = new Intent("android.intent.action.VIEW", Uri.parse(library.getLicense().getLicenseWebsite()));
                ctx.startActivity(browserIntent);
            }
        } catch (Exception e) {
        }
    }

    public int getItemViewType(int position) {
        if (position == 0 && this.header) {
            return 0;
        }
        return TYPE_ITEM;
    }

    public int getItemCount() {
        if (this.libs == null) {
            return 0;
        }
        return this.libs.size();
    }

    public Library getItem(int pos) {
        return this.libs.get(pos);
    }

    public long getItemId(int pos) {
        return pos;
    }

    public void setLibs(List<Library> libs) {
        this.libs = libs;
        notifyItemRangeInserted(0, libs.size() - TYPE_ITEM);
    }

    public void addLibs(List<Library> libs) {
        this.libs.addAll(libs);
    }

    public void setHeader(String aboutVersionName, Integer aboutVersionCode, Drawable aboutIcon) {
        this.header = true;
        this.libs.add(0, null);
        this.aboutVersionName = aboutVersionName;
        this.aboutVersionCode = aboutVersionCode;
        this.aboutIcon = aboutIcon;
        notifyItemInserted(0);
    }

    public void deleteHeader() {
        if (this.header && this.libs.size() > 0) {
            this.libs.remove(0);
        }
        this.header = false;
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder.class */
    public static class HeaderViewHolder extends RecyclerView.ViewHolder {
        ImageView aboutIcon;
        TextView aboutAppName;
        View aboutSpecialContainer;
        Button aboutSpecial1;
        Button aboutSpecial2;
        Button aboutSpecial3;
        TextView aboutVersion;
        View aboutDivider;
        TextView aboutAppDescription;

        public HeaderViewHolder(View headerView) {
            super(headerView);
            this.aboutIcon = (ImageView) headerView.findViewById(R.id.aboutIcon);
            this.aboutAppName = (TextView) headerView.findViewById(R.id.aboutName);
            this.aboutAppName.setTextColor(UIUtils.getThemeColorFromAttrOrRes(headerView.getContext(), R.attr.about_libraries_title_openSource, R.color.about_libraries_title_openSource));
            this.aboutSpecialContainer = headerView.findViewById(R.id.aboutSpecialContainer);
            this.aboutSpecial1 = (Button) headerView.findViewById(R.id.aboutSpecial1);
            this.aboutSpecial2 = (Button) headerView.findViewById(R.id.aboutSpecial2);
            this.aboutSpecial3 = (Button) headerView.findViewById(R.id.aboutSpecial3);
            this.aboutVersion = (TextView) headerView.findViewById(R.id.aboutVersion);
            this.aboutVersion.setTextColor(UIUtils.getThemeColorFromAttrOrRes(headerView.getContext(), R.attr.about_libraries_text_openSource, R.color.about_libraries_text_openSource));
            this.aboutDivider = headerView.findViewById(R.id.aboutDivider);
            this.aboutDivider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(headerView.getContext(), R.attr.about_libraries_dividerDark_openSource, R.color.about_libraries_dividerDark_openSource));
            this.aboutAppDescription = (TextView) headerView.findViewById(R.id.aboutDescription);
            this.aboutAppDescription.setTextColor(UIUtils.getThemeColorFromAttrOrRes(headerView.getContext(), R.attr.about_libraries_text_openSource, R.color.about_libraries_text_openSource));
        }
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder.class */
    public static class ViewHolder extends RecyclerView.ViewHolder {
        CardView card;
        TextView libraryName;
        TextView libraryCreator;
        View libraryDescriptionDivider;
        TextView libraryDescription;
        View libraryBottomDivider;
        View libraryBottomContainer;
        TextView libraryVersion;
        TextView libraryLicense;

        public ViewHolder(View itemView) {
            super(itemView);
            this.card = (CardView) itemView;
            this.card.setCardBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(itemView.getContext(), R.attr.about_libraries_card, R.color.about_libraries_card));
            this.libraryName = (TextView) itemView.findViewById(R.id.libraryName);
            this.libraryName.setTextColor(UIUtils.getThemeColorFromAttrOrRes(itemView.getContext(), R.attr.about_libraries_title_openSource, R.color.about_libraries_title_openSource));
            this.libraryCreator = (TextView) itemView.findViewById(R.id.libraryCreator);
            this.libraryCreator.setTextColor(UIUtils.getThemeColorFromAttrOrRes(itemView.getContext(), R.attr.about_libraries_text_openSource, R.color.about_libraries_text_openSource));
            this.libraryDescriptionDivider = itemView.findViewById(R.id.libraryDescriptionDivider);
            this.libraryDescriptionDivider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(itemView.getContext(), R.attr.about_libraries_dividerLight_openSource, R.color.about_libraries_dividerLight_openSource));
            this.libraryDescription = (TextView) itemView.findViewById(R.id.libraryDescription);
            this.libraryDescription.setTextColor(UIUtils.getThemeColorFromAttrOrRes(itemView.getContext(), R.attr.about_libraries_text_openSource, R.color.about_libraries_text_openSource));
            this.libraryBottomDivider = itemView.findViewById(R.id.libraryBottomDivider);
            this.libraryBottomDivider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(itemView.getContext(), R.attr.about_libraries_dividerLight_openSource, R.color.about_libraries_dividerLight_openSource));
            this.libraryBottomContainer = itemView.findViewById(R.id.libraryBottomContainer);
            this.libraryVersion = (TextView) itemView.findViewById(R.id.libraryVersion);
            this.libraryVersion.setTextColor(UIUtils.getThemeColorFromAttrOrRes(itemView.getContext(), R.attr.about_libraries_text_openSource, R.color.about_libraries_text_openSource));
            this.libraryLicense = (TextView) itemView.findViewById(R.id.libraryLicense);
            this.libraryLicense.setTextColor(UIUtils.getThemeColorFromAttrOrRes(itemView.getContext(), R.attr.about_libraries_text_openSource, R.color.about_libraries_text_openSource));
        }
    }
}
