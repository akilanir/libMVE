package com.mikepenz.aboutlibraries.ui.item;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.aboutlibraries.Libs;
import com.mikepenz.aboutlibraries.LibsBuilder;
import com.mikepenz.aboutlibraries.LibsConfiguration;
import com.mikepenz.aboutlibraries.R;
import com.mikepenz.aboutlibraries.util.MovementCheck;
import com.mikepenz.aboutlibraries.util.RippleForegroundListener;
import com.mikepenz.aboutlibraries.util.UIUtils;
import com.mikepenz.fastadapter.items.AbstractItem;
import com.mikepenz.fastadapter.utils.ViewHolderFactory;
import com.mikepenz.iconics.Iconics;

/* loaded from: com.mikepenz.aboutlibraries.5.5.0.jar:com/mikepenz/aboutlibraries/ui/item/HeaderItem.class */
public class HeaderItem extends AbstractItem<HeaderItem, ViewHolder> {
    private static final ViewHolderFactory<? extends ViewHolder> FACTORY = new ItemFactory();
    private RippleForegroundListener rippleForegroundListener = new RippleForegroundListener(R.id.rippleForegroundListenerView);
    private Integer aboutVersionCode;
    private String aboutVersionName;
    private Drawable aboutIcon;
    public LibsBuilder libsBuilder;

    public HeaderItem withAboutVersionCode(Integer aboutVersionCode) {
        this.aboutVersionCode = aboutVersionCode;
        return this;
    }

    public HeaderItem withAboutVersionName(String aboutVersionName) {
        this.aboutVersionName = aboutVersionName;
        return this;
    }

    public HeaderItem withAboutIcon(Drawable aboutIcon) {
        this.aboutIcon = aboutIcon;
        return this;
    }

    public HeaderItem withLibsBuilder(LibsBuilder libsBuilder) {
        this.libsBuilder = libsBuilder;
        return this;
    }

    public boolean isSelectable() {
        return false;
    }

    public int getType() {
        return R.id.header_item_id;
    }

    public int getLayoutRes() {
        return R.layout.listheader_opensource;
    }

    public void bindView(ViewHolder holder) {
        super.bindView(holder);
        final Context ctx = holder.itemView.getContext();
        if (this.libsBuilder.aboutShowIcon != null && this.libsBuilder.aboutShowIcon.booleanValue() && this.aboutIcon != null) {
            holder.aboutIcon.setImageDrawable(this.aboutIcon);
            holder.aboutIcon.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.item.HeaderItem.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    if (LibsConfiguration.getInstance().getListener() != null) {
                        LibsConfiguration.getInstance().getListener().onIconClicked(v);
                    }
                }
            });
            holder.aboutIcon.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.mikepenz.aboutlibraries.ui.item.HeaderItem.2
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
        if (!TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial1) && (!TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial1Description) || LibsConfiguration.getInstance().getListener() != null)) {
            holder.aboutSpecial1.setText(this.libsBuilder.aboutAppSpecial1);
            new Iconics.IconicsBuilder().ctx(ctx).on(holder.aboutSpecial1).build();
            holder.aboutSpecial1.setVisibility(0);
            holder.aboutSpecial1.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.item.HeaderItem.3
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    boolean consumed = false;
                    if (LibsConfiguration.getInstance().getListener() != null) {
                        consumed = LibsConfiguration.getInstance().getListener().onExtraClicked(v, Libs.SpecialButton.SPECIAL1);
                    }
                    if (!consumed && !TextUtils.isEmpty(HeaderItem.this.libsBuilder.aboutAppSpecial1Description)) {
                        try {
                            AlertDialog.Builder alert = new AlertDialog.Builder(ctx);
                            alert.setMessage(Html.fromHtml(HeaderItem.this.libsBuilder.aboutAppSpecial1Description));
                            alert.create().show();
                        } catch (Exception e) {
                        }
                    }
                }
            });
            holder.aboutSpecialContainer.setVisibility(0);
        }
        if (!TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial2) && (!TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial2Description) || LibsConfiguration.getInstance().getListener() != null)) {
            holder.aboutSpecial2.setText(this.libsBuilder.aboutAppSpecial2);
            new Iconics.IconicsBuilder().ctx(ctx).on(holder.aboutSpecial2).build();
            holder.aboutSpecial2.setVisibility(0);
            holder.aboutSpecial2.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.item.HeaderItem.4
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    boolean consumed = false;
                    if (LibsConfiguration.getInstance().getListener() != null) {
                        consumed = LibsConfiguration.getInstance().getListener().onExtraClicked(v, Libs.SpecialButton.SPECIAL2);
                    }
                    if (!consumed && !TextUtils.isEmpty(HeaderItem.this.libsBuilder.aboutAppSpecial2Description)) {
                        try {
                            AlertDialog.Builder alert = new AlertDialog.Builder(ctx);
                            alert.setMessage(Html.fromHtml(HeaderItem.this.libsBuilder.aboutAppSpecial2Description));
                            alert.create().show();
                        } catch (Exception e) {
                        }
                    }
                }
            });
            holder.aboutSpecialContainer.setVisibility(0);
        }
        if (!TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial3) && (!TextUtils.isEmpty(this.libsBuilder.aboutAppSpecial3Description) || LibsConfiguration.getInstance().getListener() != null)) {
            holder.aboutSpecial3.setText(this.libsBuilder.aboutAppSpecial3);
            new Iconics.IconicsBuilder().ctx(ctx).on(holder.aboutSpecial3).build();
            holder.aboutSpecial3.setVisibility(0);
            holder.aboutSpecial3.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.aboutlibraries.ui.item.HeaderItem.5
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    boolean consumed = false;
                    if (LibsConfiguration.getInstance().getListener() != null) {
                        consumed = LibsConfiguration.getInstance().getListener().onExtraClicked(v, Libs.SpecialButton.SPECIAL3);
                    }
                    if (!consumed && !TextUtils.isEmpty(HeaderItem.this.libsBuilder.aboutAppSpecial3Description)) {
                        try {
                            AlertDialog.Builder alert = new AlertDialog.Builder(ctx);
                            alert.setMessage(Html.fromHtml(HeaderItem.this.libsBuilder.aboutAppSpecial3Description));
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
            new Iconics.IconicsBuilder().ctx(ctx).on(holder.aboutAppDescription).build();
            holder.aboutAppDescription.setMovementMethod(MovementCheck.getInstance());
        } else {
            holder.aboutAppDescription.setVisibility(8);
        }
        if ((!this.libsBuilder.aboutShowIcon.booleanValue() && !this.libsBuilder.aboutShowVersion.booleanValue()) || TextUtils.isEmpty(this.libsBuilder.aboutDescription)) {
            holder.aboutDivider.setVisibility(8);
        }
        if (LibsConfiguration.getInstance().getLibsRecyclerViewListener() != null) {
            LibsConfiguration.getInstance().getLibsRecyclerViewListener().onBindViewHolder(holder);
        }
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.5.0.jar:com/mikepenz/aboutlibraries/ui/item/HeaderItem$ItemFactory.class */
    protected static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        protected ItemFactory() {
        }

        /* renamed from: create, reason: merged with bridge method [inline-methods] */
        public ViewHolder m7create(View v) {
            return new ViewHolder(v);
        }
    }

    public ViewHolderFactory<? extends ViewHolder> getFactory() {
        return FACTORY;
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.5.0.jar:com/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder.class */
    public static class ViewHolder extends RecyclerView.ViewHolder {
        ImageView aboutIcon;
        TextView aboutAppName;
        View aboutSpecialContainer;
        Button aboutSpecial1;
        Button aboutSpecial2;
        Button aboutSpecial3;
        TextView aboutVersion;
        View aboutDivider;
        TextView aboutAppDescription;

        public ViewHolder(View headerView) {
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
}
