.class public Lit/gmariotti/changelibs/library/view/ChangeLogListView;
.super Landroid/widget/ListView;
.source "ChangeLogListView.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;
    }
.end annotation


# static fields
.field protected static TAG:Ljava/lang/String;


# instance fields
.field protected mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

.field protected mChangeLogFileResourceId:I

.field protected mChangeLogFileResourceUrl:Ljava/lang/String;

.field protected mRowHeaderLayoutId:I

.field protected mRowLayoutId:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 54
    const-string v0, "ChangeLogListView"

    sput-object v0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 68
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 71
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mRowLayoutId:I

    iput v0, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mRowLayoutId:I

    .line 49
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mRowHeaderLayoutId:I

    iput v0, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mRowHeaderLayoutId:I

    .line 50
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mChangeLogFileResourceId:I

    iput v0, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mChangeLogFileResourceId:I

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mChangeLogFileResourceUrl:Ljava/lang/String;

    .line 73
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1c

    .line 74
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->setNestedScrollingEnabled(Z)V

    .line 76
    :cond_1c
    invoke-virtual {p0, p2, p3}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->init(Landroid/util/AttributeSet;I)V

    .line 77
    return-void
.end method


# virtual methods
.method protected init(Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyle"    # I

    .prologue
    .line 91
    invoke-virtual {p0, p1, p2}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->initAttrs(Landroid/util/AttributeSet;I)V

    .line 93
    invoke-virtual {p0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->initAdapter()V

    .line 96
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->setDividerHeight(I)V

    .line 97
    return-void
.end method

.method protected initAdapter()V
    .registers 7

    .prologue
    .line 134
    :try_start_0
    iget-object v3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mChangeLogFileResourceUrl:Ljava/lang/String;

    if-eqz v3, :cond_56

    .line 135
    new-instance v2, Lit/gmariotti/changelibs/library/parser/XmlParser;

    invoke-virtual {p0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mChangeLogFileResourceUrl:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lit/gmariotti/changelibs/library/parser/XmlParser;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 139
    .local v2, "parse":Lit/gmariotti/changelibs/library/parser/XmlParser;
    :goto_f
    new-instance v0, Lit/gmariotti/changelibs/library/internal/ChangeLog;

    invoke-direct {v0}, Lit/gmariotti/changelibs/library/internal/ChangeLog;-><init>()V

    .line 142
    .local v0, "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    new-instance v3, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    invoke-virtual {p0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v0}, Lit/gmariotti/changelibs/library/internal/ChangeLog;->getRows()Ljava/util/LinkedList;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    .line 143
    iget-object v3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    iget v4, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mRowLayoutId:I

    invoke-virtual {v3, v4}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->setmRowLayoutId(I)V

    .line 144
    iget-object v3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    iget v4, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mRowHeaderLayoutId:I

    invoke-virtual {v3, v4}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->setmRowHeaderLayoutId(I)V

    .line 147
    iget-object v3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mChangeLogFileResourceUrl:Ljava/lang/String;

    if-eqz v3, :cond_43

    iget-object v3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mChangeLogFileResourceUrl:Ljava/lang/String;

    if-eqz v3, :cond_62

    invoke-virtual {p0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lit/gmariotti/changelibs/library/Util;->isConnected(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_62

    .line 148
    :cond_43
    new-instance v3, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;

    iget-object v4, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    invoke-direct {v3, p0, v4, v2}, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;-><init>(Lit/gmariotti/changelibs/library/view/ChangeLogListView;Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;Lit/gmariotti/changelibs/library/parser/XmlParser;)V

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Void;

    invoke-virtual {v3, v4}, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 151
    :goto_50
    iget-object v3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    invoke-virtual {p0, v3}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->setAdapter(Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;)V

    .line 157
    .end local v0    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .end local v2    # "parse":Lit/gmariotti/changelibs/library/parser/XmlParser;
    :goto_55
    return-void

    .line 137
    :cond_56
    new-instance v2, Lit/gmariotti/changelibs/library/parser/XmlParser;

    invoke-virtual {p0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v4, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mChangeLogFileResourceId:I

    invoke-direct {v2, v3, v4}, Lit/gmariotti/changelibs/library/parser/XmlParser;-><init>(Landroid/content/Context;I)V

    .restart local v2    # "parse":Lit/gmariotti/changelibs/library/parser/XmlParser;
    goto :goto_f

    .line 150
    .restart local v0    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    :cond_62
    invoke-virtual {p0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lit/gmariotti/changelibs/R$string;->changelog_internal_error_internet_connection:I

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_70} :catch_71

    goto :goto_50

    .line 153
    .end local v0    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .end local v2    # "parse":Lit/gmariotti/changelibs/library/parser/XmlParser;
    :catch_71
    move-exception v1

    .line 154
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->TAG:Ljava/lang/String;

    invoke-virtual {p0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lit/gmariotti/changelibs/R$string;->changelog_internal_error_parsing:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_55
.end method

.method protected initAttrs(Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyle"    # I

    .prologue
    .line 106
    invoke-virtual {p0}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget-object v2, Lit/gmariotti/changelibs/R$styleable;->ChangeLogListView:[I

    invoke-virtual {v1, p1, v2, p2, p2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 111
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_e
    sget v1, Lit/gmariotti/changelibs/R$styleable;->ChangeLogListView_rowLayoutId:I

    iget v2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mRowLayoutId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mRowLayoutId:I

    .line 112
    sget v1, Lit/gmariotti/changelibs/R$styleable;->ChangeLogListView_rowHeaderLayoutId:I

    iget v2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mRowHeaderLayoutId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mRowHeaderLayoutId:I

    .line 115
    sget v1, Lit/gmariotti/changelibs/R$styleable;->ChangeLogListView_changeLogFileResourceId:I

    iget v2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mChangeLogFileResourceId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mChangeLogFileResourceId:I

    .line 117
    sget v1, Lit/gmariotti/changelibs/R$styleable;->ChangeLogListView_changeLogFileResourceUrl:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->mChangeLogFileResourceUrl:Ljava/lang/String;
    :try_end_34
    .catchall {:try_start_e .. :try_end_34} :catchall_38

    .line 122
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 124
    return-void

    .line 122
    :catchall_38
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 216
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public setAdapter(Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;)V
    .registers 2
    .param p1, "adapter"    # Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    .prologue
    .line 210
    invoke-super {p0, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 211
    return-void
.end method
