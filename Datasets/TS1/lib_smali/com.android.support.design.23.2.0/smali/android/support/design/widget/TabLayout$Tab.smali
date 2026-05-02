.class public final Landroid/support/design/widget/TabLayout$Tab;
.super Ljava/lang/Object;
.source "TabLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/TabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Tab"
.end annotation


# static fields
.field public static final INVALID_POSITION:I = -0x1


# instance fields
.field private mContentDesc:Ljava/lang/CharSequence;

.field private mCustomView:Landroid/view/View;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private final mParent:Landroid/support/design/widget/TabLayout;

.field private mPosition:I

.field private mTag:Ljava/lang/Object;

.field private mText:Ljava/lang/CharSequence;

.field private mView:Landroid/support/design/widget/TabLayout$TabView;


# direct methods
.method constructor <init>(Landroid/support/design/widget/TabLayout;)V
    .registers 3
    .param p1, "parent"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 1099
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1093
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    .line 1100
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    .line 1101
    return-void
.end method

.method static synthetic access$000(Landroid/support/design/widget/TabLayout$Tab;)Landroid/support/design/widget/TabLayout;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 1080
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    return-object v0
.end method

.method static synthetic access$100(Landroid/support/design/widget/TabLayout$Tab;)Landroid/support/design/widget/TabLayout$TabView;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 1080
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mView:Landroid/support/design/widget/TabLayout$TabView;

    return-object v0
.end method

.method static synthetic access$102(Landroid/support/design/widget/TabLayout$Tab;Landroid/support/design/widget/TabLayout$TabView;)Landroid/support/design/widget/TabLayout$TabView;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout$Tab;
    .param p1, "x1"    # Landroid/support/design/widget/TabLayout$TabView;

    .prologue
    .line 1080
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mView:Landroid/support/design/widget/TabLayout$TabView;

    return-object p1
.end method

.method static synthetic access$200(Landroid/support/design/widget/TabLayout$Tab;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 1080
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout$Tab;->reset()V

    return-void
.end method

.method static synthetic access$500(Landroid/support/design/widget/TabLayout$Tab;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 1080
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout$Tab;->updateView()V

    return-void
.end method

.method private reset()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1321
    iput-object v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mView:Landroid/support/design/widget/TabLayout$TabView;

    .line 1322
    iput-object v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mTag:Ljava/lang/Object;

    .line 1323
    iput-object v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 1324
    iput-object v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mText:Ljava/lang/CharSequence;

    .line 1325
    iput-object v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mContentDesc:Ljava/lang/CharSequence;

    .line 1326
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    .line 1327
    iput-object v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mCustomView:Landroid/view/View;

    .line 1328
    return-void
.end method

.method private updateView()V
    .registers 2

    .prologue
    .line 1315
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mView:Landroid/support/design/widget/TabLayout$TabView;

    if-eqz v0, :cond_9

    .line 1316
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mView:Landroid/support/design/widget/TabLayout$TabView;

    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout$TabView;->update()V

    .line 1318
    :cond_9
    return-void
.end method


# virtual methods
.method public getContentDescription()Ljava/lang/CharSequence;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1311
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mContentDesc:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getCustomView()Landroid/view/View;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1132
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mCustomView:Landroid/view/View;

    return-object v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1181
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getPosition()I
    .registers 2

    .prologue
    .line 1191
    iget v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    return v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1108
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mTag:Ljava/lang/Object;

    return-object v0
.end method

.method public getText()Ljava/lang/CharSequence;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1205
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public isSelected()Z
    .registers 3

    .prologue
    .line 1269
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout;->getSelectedTabPosition()I

    move-result v0

    iget v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public select()V
    .registers 2

    .prologue
    .line 1262
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v0, p0}, Landroid/support/design/widget/TabLayout;->selectTab(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 1263
    return-void
.end method

.method public setContentDescription(I)Landroid/support/design/widget/TabLayout$Tab;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1283
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$Tab;->setContentDescription(Ljava/lang/CharSequence;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setContentDescription(Ljava/lang/CharSequence;)Landroid/support/design/widget/TabLayout$Tab;
    .registers 2
    .param p1, "contentDesc"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1297
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mContentDesc:Ljava/lang/CharSequence;

    .line 1298
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout$Tab;->updateView()V

    .line 1299
    return-object p0
.end method

.method public setCustomView(I)Landroid/support/design/widget/TabLayout$Tab;
    .registers 5
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1170
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mView:Landroid/support/design/widget/TabLayout$TabView;

    invoke-virtual {v1}, Landroid/support/design/widget/TabLayout$TabView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 1171
    .local v0, "inflater":Landroid/view/LayoutInflater;
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mView:Landroid/support/design/widget/TabLayout$TabView;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/design/widget/TabLayout$Tab;->setCustomView(Landroid/view/View;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v1

    return-object v1
.end method

.method public setCustomView(Landroid/view/View;)Landroid/support/design/widget/TabLayout$Tab;
    .registers 2
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1150
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mCustomView:Landroid/view/View;

    .line 1151
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout$Tab;->updateView()V

    .line 1152
    return-object p0
.end method

.method public setIcon(I)Landroid/support/design/widget/TabLayout$Tab;
    .registers 4
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1229
    invoke-static {}, Landroid/support/v7/widget/AppCompatDrawableManager;->get()Landroid/support/v7/widget/AppCompatDrawableManager;

    move-result-object v0

    iget-object v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v1}, Landroid/support/design/widget/TabLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$Tab;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/support/design/widget/TabLayout$Tab;
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1216
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 1217
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout$Tab;->updateView()V

    .line 1218
    return-object p0
.end method

.method setPosition(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 1195
    iput p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    .line 1196
    return-void
.end method

.method public setTag(Ljava/lang/Object;)Landroid/support/design/widget/TabLayout$Tab;
    .registers 2
    .param p1, "tag"    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1119
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mTag:Ljava/lang/Object;

    .line 1120
    return-object p0
.end method

.method public setText(I)Landroid/support/design/widget/TabLayout$Tab;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1255
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$Tab;->setText(Ljava/lang/CharSequence;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setText(Ljava/lang/CharSequence;)Landroid/support/design/widget/TabLayout$Tab;
    .registers 2
    .param p1, "text"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1241
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mText:Ljava/lang/CharSequence;

    .line 1242
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout$Tab;->updateView()V

    .line 1243
    return-object p0
.end method
