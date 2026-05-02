.class public Landroid/support/v7/app/WindowDecorActionBar$TabImpl;
.super Landroid/support/v7/app/ActionBar$Tab;
.source "WindowDecorActionBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/WindowDecorActionBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TabImpl"
.end annotation


# instance fields
.field private mCallback:Landroid/support/v7/app/ActionBar$TabListener;

.field private mContentDesc:Ljava/lang/CharSequence;

.field private mCustomView:Landroid/view/View;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private mPosition:I

.field private mTag:Ljava/lang/Object;

.field private mText:Ljava/lang/CharSequence;

.field final synthetic this$0:Landroid/support/v7/app/WindowDecorActionBar;


# direct methods
.method public constructor <init>(Landroid/support/v7/app/WindowDecorActionBar;)V
    .registers 3
    .param p1, "this$0"    # Landroid/support/v7/app/WindowDecorActionBar;

    .prologue
    .line 1116
    iput-object p1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->this$0:Landroid/support/v7/app/WindowDecorActionBar;

    invoke-direct {p0}, Landroid/support/v7/app/ActionBar$Tab;-><init>()V

    .line 1122
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    return-void
.end method


# virtual methods
.method public getCallback()Landroid/support/v7/app/ActionBar$TabListener;
    .registers 2

    .prologue
    .line 1137
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mCallback:Landroid/support/v7/app/ActionBar$TabListener;

    return-object v0
.end method

.method public getContentDescription()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1234
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mContentDesc:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getCustomView()Landroid/view/View;
    .registers 2

    .prologue
    .line 1148
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mCustomView:Landroid/view/View;

    return-object v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 1168
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getPosition()I
    .registers 2

    .prologue
    .line 1173
    iget v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    return v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 1127
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mTag:Ljava/lang/Object;

    return-object v0
.end method

.method public getText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1182
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public select()V
    .registers 2

    .prologue
    .line 1215
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->this$0:Landroid/support/v7/app/WindowDecorActionBar;

    invoke-virtual {v0, p0}, Landroid/support/v7/app/WindowDecorActionBar;->selectTab(Landroid/support/v7/app/ActionBar$Tab;)V

    .line 1216
    return-void
.end method

.method public setContentDescription(I)Landroid/support/v7/app/ActionBar$Tab;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 1220
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->this$0:Landroid/support/v7/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/app/WindowDecorActionBar;->mContext:Landroid/content/Context;
    invoke-static {v0}, Landroid/support/v7/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/app/WindowDecorActionBar;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->setContentDescription(Ljava/lang/CharSequence;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setContentDescription(Ljava/lang/CharSequence;)Landroid/support/v7/app/ActionBar$Tab;
    .registers 4
    .param p1, "contentDesc"    # Ljava/lang/CharSequence;

    .prologue
    .line 1225
    iput-object p1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mContentDesc:Ljava/lang/CharSequence;

    .line 1226
    iget v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    if-ltz v0, :cond_11

    .line 1227
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->this$0:Landroid/support/v7/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/app/WindowDecorActionBar;->mTabScrollView:Landroid/support/v7/widget/ScrollingTabContainerView;
    invoke-static {v0}, Landroid/support/v7/app/WindowDecorActionBar;->access$1100(Landroid/support/v7/app/WindowDecorActionBar;)Landroid/support/v7/widget/ScrollingTabContainerView;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ScrollingTabContainerView;->updateTab(I)V

    .line 1229
    :cond_11
    return-object p0
.end method

.method public setCustomView(I)Landroid/support/v7/app/ActionBar$Tab;
    .registers 4
    .param p1, "layoutResId"    # I

    .prologue
    .line 1162
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->this$0:Landroid/support/v7/app/WindowDecorActionBar;

    invoke-virtual {v0}, Landroid/support/v7/app/WindowDecorActionBar;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    .line 1163
    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1162
    invoke-virtual {p0, v0}, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->setCustomView(Landroid/view/View;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setCustomView(Landroid/view/View;)Landroid/support/v7/app/ActionBar$Tab;
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1153
    iput-object p1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mCustomView:Landroid/view/View;

    .line 1154
    iget v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    if-ltz v0, :cond_11

    .line 1155
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->this$0:Landroid/support/v7/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/app/WindowDecorActionBar;->mTabScrollView:Landroid/support/v7/widget/ScrollingTabContainerView;
    invoke-static {v0}, Landroid/support/v7/app/WindowDecorActionBar;->access$1100(Landroid/support/v7/app/WindowDecorActionBar;)Landroid/support/v7/widget/ScrollingTabContainerView;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ScrollingTabContainerView;->updateTab(I)V

    .line 1157
    :cond_11
    return-object p0
.end method

.method public setIcon(I)Landroid/support/v7/app/ActionBar$Tab;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 1196
    invoke-static {}, Landroid/support/v7/widget/AppCompatDrawableManager;->get()Landroid/support/v7/widget/AppCompatDrawableManager;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->this$0:Landroid/support/v7/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/app/WindowDecorActionBar;->mContext:Landroid/content/Context;
    invoke-static {v1}, Landroid/support/v7/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/app/WindowDecorActionBar;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/support/v7/app/ActionBar$Tab;
    .registers 4
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 1187
    iput-object p1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 1188
    iget v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    if-ltz v0, :cond_11

    .line 1189
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->this$0:Landroid/support/v7/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/app/WindowDecorActionBar;->mTabScrollView:Landroid/support/v7/widget/ScrollingTabContainerView;
    invoke-static {v0}, Landroid/support/v7/app/WindowDecorActionBar;->access$1100(Landroid/support/v7/app/WindowDecorActionBar;)Landroid/support/v7/widget/ScrollingTabContainerView;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ScrollingTabContainerView;->updateTab(I)V

    .line 1191
    :cond_11
    return-object p0
.end method

.method public setPosition(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 1177
    iput p1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    .line 1178
    return-void
.end method

.method public setTabListener(Landroid/support/v7/app/ActionBar$TabListener;)Landroid/support/v7/app/ActionBar$Tab;
    .registers 2
    .param p1, "callback"    # Landroid/support/v7/app/ActionBar$TabListener;

    .prologue
    .line 1142
    iput-object p1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mCallback:Landroid/support/v7/app/ActionBar$TabListener;

    .line 1143
    return-object p0
.end method

.method public setTag(Ljava/lang/Object;)Landroid/support/v7/app/ActionBar$Tab;
    .registers 2
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 1132
    iput-object p1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mTag:Ljava/lang/Object;

    .line 1133
    return-object p0
.end method

.method public setText(I)Landroid/support/v7/app/ActionBar$Tab;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 1210
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->this$0:Landroid/support/v7/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/app/WindowDecorActionBar;->mContext:Landroid/content/Context;
    invoke-static {v0}, Landroid/support/v7/app/WindowDecorActionBar;->access$1000(Landroid/support/v7/app/WindowDecorActionBar;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->setText(Ljava/lang/CharSequence;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setText(Ljava/lang/CharSequence;)Landroid/support/v7/app/ActionBar$Tab;
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 1201
    iput-object p1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mText:Ljava/lang/CharSequence;

    .line 1202
    iget v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    if-ltz v0, :cond_11

    .line 1203
    iget-object v0, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->this$0:Landroid/support/v7/app/WindowDecorActionBar;

    # getter for: Landroid/support/v7/app/WindowDecorActionBar;->mTabScrollView:Landroid/support/v7/widget/ScrollingTabContainerView;
    invoke-static {v0}, Landroid/support/v7/app/WindowDecorActionBar;->access$1100(Landroid/support/v7/app/WindowDecorActionBar;)Landroid/support/v7/widget/ScrollingTabContainerView;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/app/WindowDecorActionBar$TabImpl;->mPosition:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ScrollingTabContainerView;->updateTab(I)V

    .line 1205
    :cond_11
    return-object p0
.end method
