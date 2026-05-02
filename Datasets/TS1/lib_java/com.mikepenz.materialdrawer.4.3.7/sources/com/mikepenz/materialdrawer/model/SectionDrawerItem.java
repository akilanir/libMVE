package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.graphics.Typeface;
import android.support.annotation.LayoutRes;
import android.support.annotation.StringRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.TextView;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.holder.ColorHolder;
import com.mikepenz.materialdrawer.holder.StringHolder;
import com.mikepenz.materialdrawer.model.interfaces.Nameable;
import com.mikepenz.materialdrawer.model.interfaces.Typefaceable;
import com.mikepenz.materialdrawer.model.utils.ViewHolderFactory;
import com.mikepenz.materialize.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/SectionDrawerItem.class */
public class SectionDrawerItem extends AbstractDrawerItem<SectionDrawerItem> implements Nameable<SectionDrawerItem>, Typefaceable<SectionDrawerItem> {
    private StringHolder name;
    private ColorHolder textColor;
    private boolean divider = true;
    private Typeface typeface = null;

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public SectionDrawerItem withName(StringHolder name) {
        this.name = name;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public SectionDrawerItem withName(String name) {
        this.name = new StringHolder(name);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public SectionDrawerItem withName(@StringRes int nameRes) {
        this.name = new StringHolder(nameRes);
        return this;
    }

    public SectionDrawerItem withDivider(boolean divider) {
        this.divider = divider;
        return this;
    }

    public SectionDrawerItem withTextColor(int textColor) {
        this.textColor = ColorHolder.fromColor(textColor);
        return this;
    }

    public SectionDrawerItem withTextColorRes(int textColorRes) {
        this.textColor = ColorHolder.fromColorRes(textColorRes);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public SectionDrawerItem withTypeface(Typeface typeface) {
        this.typeface = typeface;
        return this;
    }

    public boolean hasDivider() {
        return this.divider;
    }

    public ColorHolder getTextColor() {
        return this.textColor;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public StringHolder getName() {
        return this.name;
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem, com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public boolean isEnabled() {
        return false;
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem, com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public boolean isSelected() {
        return false;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "SECTION_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    @LayoutRes
    public int getLayoutRes() {
        return R.layout.material_drawer_item_section;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public Typeface getTypeface() {
        return this.typeface;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public void bindView(RecyclerView.ViewHolder holder) {
        Context ctx = holder.itemView.getContext();
        ViewHolder viewHolder = (ViewHolder) holder;
        holder.itemView.setId(getIdentifier());
        viewHolder.view.setClickable(false);
        viewHolder.view.setEnabled(false);
        viewHolder.name.setTextColor(ColorHolder.color(getTextColor(), ctx, R.attr.material_drawer_secondary_text, R.color.material_drawer_secondary_text));
        StringHolder.applyTo(getName(), viewHolder.name);
        if (hasDivider()) {
            viewHolder.divider.setVisibility(0);
        } else {
            viewHolder.divider.setVisibility(8);
        }
        viewHolder.divider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(ctx, R.attr.material_drawer_divider, R.color.material_drawer_divider));
        onPostBindView(this, holder.itemView);
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem
    public ViewHolderFactory getFactory() {
        return new ItemFactory();
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/SectionDrawerItem$ItemFactory.class */
    public static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        @Override // com.mikepenz.materialdrawer.model.utils.ViewHolderFactory
        public ViewHolder factory(View v) {
            return new ViewHolder(v);
        }
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder.class */
    private static class ViewHolder extends RecyclerView.ViewHolder {
        private View view;
        private View divider;
        private TextView name;

        private ViewHolder(View view) {
            super(view);
            this.view = view;
            this.divider = view.findViewById(R.id.material_drawer_divider);
            this.name = (TextView) view.findViewById(R.id.material_drawer_name);
        }
    }
}
