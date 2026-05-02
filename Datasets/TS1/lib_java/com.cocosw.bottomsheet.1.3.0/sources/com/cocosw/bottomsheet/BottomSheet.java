package com.cocosw.bottomsheet;

import android.R;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.DrawableRes;
import android.support.annotation.IntegerRes;
import android.support.annotation.MenuRes;
import android.support.annotation.NonNull;
import android.support.annotation.StringRes;
import android.support.annotation.StyleRes;
import android.transition.ChangeBounds;
import android.transition.Transition;
import android.transition.TransitionManager;
import android.util.SparseIntArray;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.TextView;
import com.cocosw.bottomsheet.ClosableSlidingLayout;
import com.cocosw.bottomsheet.SimpleSectionedGridAdapter;
import java.lang.reflect.Field;
import java.util.ArrayList;

/* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/BottomSheet.class */
public class BottomSheet extends Dialog implements DialogInterface {
    private final SparseIntArray hidden;
    private TranslucentHelper helper;
    private String moreText;
    private Drawable close;
    private Drawable more;
    private int mHeaderLayoutId;
    private int mListItemLayoutId;
    private int mGridItemLayoutId;
    private boolean collapseListIcons;
    private GridView list;
    private SimpleSectionedGridAdapter adapter;
    private Builder builder;
    private ImageView icon;
    private int limit;
    private boolean cancelOnTouchOutside;
    private boolean cancelOnSwipeDown;
    private ActionMenu fullMenuItem;
    private ActionMenu menuItem;
    private ActionMenu actions;
    private DialogInterface.OnDismissListener dismissListener;
    private DialogInterface.OnShowListener showListener;

    BottomSheet(Context context) {
        super(context, R.style.BottomSheet_Dialog);
        this.hidden = new SparseIntArray();
        this.limit = -1;
        this.cancelOnTouchOutside = true;
        this.cancelOnSwipeDown = true;
    }

    BottomSheet(Context context, int theme) {
        super(context, theme);
        this.hidden = new SparseIntArray();
        this.limit = -1;
        this.cancelOnTouchOutside = true;
        this.cancelOnSwipeDown = true;
        TypedArray a = getContext().obtainStyledAttributes(null, R.styleable.BottomSheet, R.attr.bs_bottomSheetStyle, 0);
        try {
            this.more = a.getDrawable(R.styleable.BottomSheet_bs_moreDrawable);
            this.close = a.getDrawable(R.styleable.BottomSheet_bs_closeDrawable);
            this.moreText = a.getString(R.styleable.BottomSheet_bs_moreText);
            this.collapseListIcons = a.getBoolean(R.styleable.BottomSheet_bs_collapseListIcons, true);
            this.mHeaderLayoutId = a.getResourceId(R.styleable.BottomSheet_bs_headerLayout, R.layout.bs_header);
            this.mListItemLayoutId = a.getResourceId(R.styleable.BottomSheet_bs_listItemLayout, R.layout.bs_list_entry);
            this.mGridItemLayoutId = a.getResourceId(R.styleable.BottomSheet_bs_gridItemLayout, R.layout.bs_grid_entry);
            a.recycle();
            if (Build.VERSION.SDK_INT >= 19) {
                this.helper = new TranslucentHelper(this, context);
            }
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    private int getNumColumns() {
        try {
            Field numColumns = GridView.class.getDeclaredField("mRequestedNumColumns");
            numColumns.setAccessible(true);
            return numColumns.getInt(this.list);
        } catch (Exception e) {
            return 1;
        }
    }

    @Override // android.app.Dialog
    public void setCanceledOnTouchOutside(boolean cancel) {
        super.setCanceledOnTouchOutside(cancel);
        this.cancelOnTouchOutside = cancel;
    }

    public void setCanceledOnSwipeDown(boolean cancel) {
        this.cancelOnSwipeDown = cancel;
    }

    @Override // android.app.Dialog
    public void setOnShowListener(DialogInterface.OnShowListener listener) {
        this.showListener = listener;
    }

    private void init(Context context) {
        setCanceledOnTouchOutside(this.cancelOnTouchOutside);
        final ClosableSlidingLayout mDialogView = (ClosableSlidingLayout) View.inflate(context, R.layout.bottom_sheet_dialog, null);
        LinearLayout mainLayout = (LinearLayout) mDialogView.findViewById(R.id.bs_main);
        mainLayout.addView(View.inflate(context, this.mHeaderLayoutId, null), 0);
        setContentView(mDialogView);
        if (!this.cancelOnSwipeDown) {
            mDialogView.swipeable = this.cancelOnSwipeDown;
        }
        mDialogView.setSlideListener(new ClosableSlidingLayout.SlideListener() { // from class: com.cocosw.bottomsheet.BottomSheet.1
            @Override // com.cocosw.bottomsheet.ClosableSlidingLayout.SlideListener
            public void onClosed() {
                BottomSheet.this.dismiss();
            }

            @Override // com.cocosw.bottomsheet.ClosableSlidingLayout.SlideListener
            public void onOpened() {
                BottomSheet.this.showFullItems();
            }
        });
        super.setOnShowListener(new DialogInterface.OnShowListener() { // from class: com.cocosw.bottomsheet.BottomSheet.2
            @Override // android.content.DialogInterface.OnShowListener
            public void onShow(DialogInterface dialogInterface) {
                if (BottomSheet.this.showListener != null) {
                    BottomSheet.this.showListener.onShow(dialogInterface);
                }
                BottomSheet.this.list.setAdapter((ListAdapter) BottomSheet.this.adapter);
                BottomSheet.this.list.startLayoutAnimation();
                if (BottomSheet.this.builder.icon == null) {
                    BottomSheet.this.icon.setVisibility(8);
                } else {
                    BottomSheet.this.icon.setVisibility(0);
                    BottomSheet.this.icon.setImageDrawable(BottomSheet.this.builder.icon);
                }
            }
        });
        int[] location = new int[2];
        mDialogView.getLocationOnScreen(location);
        if (Build.VERSION.SDK_INT >= 19) {
            mDialogView.setPadding(0, location[0] == 0 ? this.helper.mStatusBarHeight : 0, 0, 0);
            mDialogView.getChildAt(0).setPadding(0, 0, 0, this.helper.mNavBarAvailable ? this.helper.getNavigationBarHeight(getContext()) + mDialogView.getPaddingBottom() : 0);
        }
        TextView title = (TextView) mDialogView.findViewById(R.id.bottom_sheet_title);
        if (this.builder.title != null) {
            title.setVisibility(0);
            title.setText(this.builder.title);
        }
        this.icon = (ImageView) mDialogView.findViewById(R.id.bottom_sheet_title_image);
        this.list = (GridView) mDialogView.findViewById(R.id.bottom_sheet_gridview);
        mDialogView.mTarget = this.list;
        if (!this.builder.grid) {
            this.list.setNumColumns(1);
        }
        if (this.builder.grid) {
            for (int i = 0; i < getMenu().size(); i++) {
                if (getMenu().getItem(i).getIcon() == null) {
                    throw new IllegalArgumentException("You must set icon for each items in grid style");
                }
            }
        }
        if (this.builder.limit > 0) {
            this.limit = this.builder.limit * getNumColumns();
        } else {
            this.limit = Integer.MAX_VALUE;
        }
        mDialogView.setCollapsible(false);
        this.actions = this.builder.menu;
        this.menuItem = this.actions;
        if (getMenu().size() > this.limit) {
            this.fullMenuItem = this.builder.menu;
            this.menuItem = this.builder.menu.clone(this.limit - 1);
            ActionMenuItem item = new ActionMenuItem(context, 0, R.id.bs_more, 0, this.limit - 1, this.moreText);
            item.setIcon(this.more);
            this.menuItem.add(item);
            this.actions = this.menuItem;
            mDialogView.setCollapsible(true);
        }
        BaseAdapter baseAdapter = new BaseAdapter() { // from class: com.cocosw.bottomsheet.BottomSheet.3
            @Override // android.widget.Adapter
            public int getCount() {
                return BottomSheet.this.actions.size() - BottomSheet.this.hidden.size();
            }

            @Override // android.widget.Adapter
            public MenuItem getItem(int position) {
                return BottomSheet.this.actions.getItem(position);
            }

            @Override // android.widget.Adapter
            public long getItemId(int position) {
                return position;
            }

            @Override // android.widget.BaseAdapter, android.widget.Adapter
            public int getViewTypeCount() {
                return 1;
            }

            @Override // android.widget.BaseAdapter, android.widget.ListAdapter
            public boolean isEnabled(int position) {
                return getItem(position).isEnabled();
            }

            @Override // android.widget.BaseAdapter, android.widget.ListAdapter
            public boolean areAllItemsEnabled() {
                return false;
            }

            @Override // android.widget.Adapter
            public View getView(int position, View convertView, ViewGroup parent) {
                ViewHolder holder;
                if (convertView == null) {
                    LayoutInflater inflater = (LayoutInflater) BottomSheet.this.getContext().getSystemService("layout_inflater");
                    if (BottomSheet.this.builder.grid) {
                        convertView = inflater.inflate(BottomSheet.this.mGridItemLayoutId, parent, false);
                    } else {
                        convertView = inflater.inflate(BottomSheet.this.mListItemLayoutId, parent, false);
                    }
                    holder = new ViewHolder();
                    holder.title = (TextView) convertView.findViewById(R.id.bs_list_title);
                    holder.image = (ImageView) convertView.findViewById(R.id.bs_list_image);
                    convertView.setTag(holder);
                } else {
                    holder = (ViewHolder) convertView.getTag();
                }
                for (int i2 = 0; i2 < BottomSheet.this.hidden.size(); i2++) {
                    if (BottomSheet.this.hidden.valueAt(i2) <= position) {
                        position++;
                    }
                }
                MenuItem item2 = getItem(position);
                holder.title.setText(item2.getTitle());
                if (item2.getIcon() == null) {
                    holder.image.setVisibility(BottomSheet.this.collapseListIcons ? 8 : 4);
                } else {
                    holder.image.setVisibility(0);
                    holder.image.setImageDrawable(item2.getIcon());
                }
                holder.image.setEnabled(item2.isEnabled());
                holder.title.setEnabled(item2.isEnabled());
                return convertView;
            }

            /* renamed from: com.cocosw.bottomsheet.BottomSheet$3$ViewHolder */
            /* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/BottomSheet$3$ViewHolder.class */
            class ViewHolder {
                private TextView title;
                private ImageView image;

                ViewHolder() {
                }
            }
        };
        this.adapter = new SimpleSectionedGridAdapter(context, baseAdapter, R.layout.bs_list_divider, R.id.headerlayout, R.id.header);
        this.list.setAdapter((ListAdapter) this.adapter);
        this.adapter.setGridView(this.list);
        this.list.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.cocosw.bottomsheet.BottomSheet.4
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                if (((MenuItem) BottomSheet.this.adapter.getItem(position)).getItemId() == R.id.bs_more) {
                    BottomSheet.this.showFullItems();
                    mDialogView.setCollapsible(false);
                    return;
                }
                if (!((ActionMenuItem) BottomSheet.this.adapter.getItem(position)).invoke()) {
                    if (BottomSheet.this.builder.menulistener != null) {
                        BottomSheet.this.builder.menulistener.onMenuItemClick((MenuItem) BottomSheet.this.adapter.getItem(position));
                    } else if (BottomSheet.this.builder.listener != null) {
                        BottomSheet.this.builder.listener.onClick(BottomSheet.this, ((MenuItem) BottomSheet.this.adapter.getItem(position)).getItemId());
                    }
                }
                BottomSheet.this.dismiss();
            }
        });
        if (this.builder.dismissListener != null) {
            setOnDismissListener(this.builder.dismissListener);
        }
        setListLayout();
    }

    private void updateSection() {
        this.actions.removeInvisible();
        if (!this.builder.grid && this.actions.size() > 0) {
            int groupId = this.actions.getItem(0).getGroupId();
            ArrayList<SimpleSectionedGridAdapter.Section> sections = new ArrayList<>();
            for (int i = 0; i < this.actions.size(); i++) {
                if (this.actions.getItem(i).getGroupId() != groupId) {
                    groupId = this.actions.getItem(i).getGroupId();
                    sections.add(new SimpleSectionedGridAdapter.Section(i, null));
                }
            }
            if (sections.size() > 0) {
                SimpleSectionedGridAdapter.Section[] s = new SimpleSectionedGridAdapter.Section[sections.size()];
                sections.toArray(s);
                this.adapter.setSections(s);
                return;
            }
            this.adapter.mSections.clear();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showFullItems() {
        if (Build.VERSION.SDK_INT >= 19) {
            Transition changeBounds = new ChangeBounds();
            changeBounds.setDuration(300L);
            TransitionManager.beginDelayedTransition(this.list, changeBounds);
        }
        this.actions = this.fullMenuItem;
        updateSection();
        this.adapter.notifyDataSetChanged();
        this.list.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
        this.icon.setVisibility(0);
        this.icon.setImageDrawable(this.close);
        this.icon.setOnClickListener(new View.OnClickListener() { // from class: com.cocosw.bottomsheet.BottomSheet.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                BottomSheet.this.showShortItems();
            }
        });
        setListLayout();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showShortItems() {
        this.actions = this.menuItem;
        updateSection();
        this.adapter.notifyDataSetChanged();
        setListLayout();
        if (this.builder.icon == null) {
            this.icon.setVisibility(8);
        } else {
            this.icon.setVisibility(0);
            this.icon.setImageDrawable(this.builder.icon);
        }
    }

    @Override // android.app.Dialog
    protected void onStart() {
        super.onStart();
        showShortItems();
    }

    private boolean hasDivider() {
        return this.adapter.mSections.size() > 0;
    }

    private void setListLayout() {
        if (!hasDivider()) {
            return;
        }
        this.list.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.cocosw.bottomsheet.BottomSheet.6
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                if (Build.VERSION.SDK_INT < 16) {
                    BottomSheet.this.list.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                } else {
                    BottomSheet.this.list.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
                View lastChild = BottomSheet.this.list.getChildAt(BottomSheet.this.list.getChildCount() - 1);
                if (lastChild != null) {
                    BottomSheet.this.list.setLayoutParams(new LinearLayout.LayoutParams(-1, lastChild.getBottom() + lastChild.getPaddingBottom() + BottomSheet.this.list.getPaddingBottom()));
                }
            }
        });
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        init(getContext());
        WindowManager.LayoutParams params = getWindow().getAttributes();
        params.height = -2;
        params.gravity = 80;
        TypedArray a = getContext().obtainStyledAttributes(new int[]{R.attr.layout_width});
        try {
            params.width = a.getLayoutDimension(0, -1);
            a.recycle();
            super.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.cocosw.bottomsheet.BottomSheet.7
                @Override // android.content.DialogInterface.OnDismissListener
                public void onDismiss(DialogInterface dialog) {
                    if (BottomSheet.this.dismissListener != null) {
                        BottomSheet.this.dismissListener.onDismiss(dialog);
                    }
                    if (BottomSheet.this.limit != Integer.MAX_VALUE) {
                        BottomSheet.this.showShortItems();
                    }
                }
            });
            getWindow().setAttributes(params);
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    public Menu getMenu() {
        return this.builder.menu;
    }

    public void invalidate() {
        updateSection();
        this.adapter.notifyDataSetChanged();
        setListLayout();
    }

    @Override // android.app.Dialog
    public void setOnDismissListener(DialogInterface.OnDismissListener listener) {
        this.dismissListener = listener;
    }

    /* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/BottomSheet$Builder.class */
    public static class Builder {
        private final Context context;
        private final ActionMenu menu;
        private int theme;
        private CharSequence title;
        private boolean grid;
        private DialogInterface.OnClickListener listener;
        private DialogInterface.OnDismissListener dismissListener;
        private Drawable icon;
        private int limit;
        private MenuItem.OnMenuItemClickListener menulistener;

        public Builder(@NonNull Activity context) {
            this(context, R.style.BottomSheet_Dialog);
            TypedArray ta = context.getTheme().obtainStyledAttributes(new int[]{R.attr.bs_bottomSheetStyle});
            try {
                this.theme = ta.getResourceId(0, R.style.BottomSheet_Dialog);
                ta.recycle();
            } catch (Throwable th) {
                ta.recycle();
                throw th;
            }
        }

        public Builder(Context context, @StyleRes int theme) {
            this.limit = -1;
            this.context = context;
            this.theme = theme;
            this.menu = new ActionMenu(context);
        }

        public Builder sheet(@MenuRes int xmlRes) {
            new MenuInflater(this.context).inflate(xmlRes, this.menu);
            return this;
        }

        public Builder sheet(int id, @DrawableRes int iconRes, @StringRes int textRes) {
            ActionMenuItem item = new ActionMenuItem(this.context, 0, id, 0, 0, this.context.getText(textRes));
            item.setIcon(iconRes);
            this.menu.add(item);
            return this;
        }

        public Builder sheet(int id, @NonNull Drawable icon, @NonNull CharSequence text) {
            ActionMenuItem item = new ActionMenuItem(this.context, 0, id, 0, 0, text);
            item.setIcon(icon);
            this.menu.add(item);
            return this;
        }

        public Builder sheet(int id, @StringRes int textRes) {
            this.menu.add(0, id, 0, textRes);
            return this;
        }

        public Builder sheet(int id, @NonNull CharSequence text) {
            this.menu.add(0, id, 0, text);
            return this;
        }

        public Builder title(@StringRes int titleRes) {
            this.title = this.context.getText(titleRes);
            return this;
        }

        @Deprecated
        public Builder remove(int id) {
            this.menu.removeItem(id);
            return this;
        }

        public Builder icon(Drawable icon) {
            this.icon = icon;
            return this;
        }

        public Builder icon(@DrawableRes int iconRes) {
            this.icon = this.context.getResources().getDrawable(iconRes);
            return this;
        }

        public Builder listener(@NonNull DialogInterface.OnClickListener listener) {
            this.listener = listener;
            return this;
        }

        public Builder listener(@NonNull MenuItem.OnMenuItemClickListener listener) {
            this.menulistener = listener;
            return this;
        }

        public Builder darkTheme() {
            this.theme = R.style.BottomSheet_Dialog_Dark;
            return this;
        }

        public BottomSheet show() {
            BottomSheet dialog = build();
            dialog.show();
            return dialog;
        }

        public Builder grid() {
            this.grid = true;
            return this;
        }

        public Builder limit(@IntegerRes int limitRes) {
            this.limit = this.context.getResources().getInteger(limitRes);
            return this;
        }

        @SuppressLint({"Override"})
        public BottomSheet build() {
            BottomSheet dialog = new BottomSheet(this.context, this.theme);
            dialog.builder = this;
            return dialog;
        }

        public Builder title(CharSequence title) {
            this.title = title;
            return this;
        }

        public Builder setOnDismissListener(@NonNull DialogInterface.OnDismissListener listener) {
            this.dismissListener = listener;
            return this;
        }
    }
}
