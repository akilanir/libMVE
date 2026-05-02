.class public Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;
.super Landroid/os/AsyncTask;
.source "ChangeLogListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/gmariotti/changelibs/library/view/ChangeLogListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ParseAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lit/gmariotti/changelibs/library/internal/ChangeLog;",
        ">;"
    }
.end annotation


# instance fields
.field private mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

.field private mParse:Lit/gmariotti/changelibs/library/parser/XmlParser;

.field final synthetic this$0:Lit/gmariotti/changelibs/library/view/ChangeLogListView;


# direct methods
.method public constructor <init>(Lit/gmariotti/changelibs/library/view/ChangeLogListView;Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;Lit/gmariotti/changelibs/library/parser/XmlParser;)V
    .registers 4
    .param p2, "adapter"    # Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;
    .param p3, "parse"    # Lit/gmariotti/changelibs/library/parser/XmlParser;

    .prologue
    .line 168
    iput-object p1, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->this$0:Lit/gmariotti/changelibs/library/view/ChangeLogListView;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 169
    iput-object p2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    .line 170
    iput-object p3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->mParse:Lit/gmariotti/changelibs/library/parser/XmlParser;

    .line 171
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .registers 7
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 177
    :try_start_0
    iget-object v2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->mParse:Lit/gmariotti/changelibs/library/parser/XmlParser;

    if-eqz v2, :cond_1d

    .line 178
    iget-object v2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->mParse:Lit/gmariotti/changelibs/library/parser/XmlParser;

    invoke-virtual {v2}, Lit/gmariotti/changelibs/library/parser/XmlParser;->readChangeLogFile()Lit/gmariotti/changelibs/library/internal/ChangeLog;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v0

    .line 184
    :goto_a
    return-object v0

    .line 181
    :catch_b
    move-exception v1

    .line 182
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->TAG:Ljava/lang/String;

    iget-object v3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->this$0:Lit/gmariotti/changelibs/library/view/ChangeLogListView;

    invoke-virtual {v3}, Lit/gmariotti/changelibs/library/view/ChangeLogListView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lit/gmariotti/changelibs/R$string;->changelog_internal_error_parsing:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 184
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1d
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 163
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->doInBackground([Ljava/lang/Void;)Lit/gmariotti/changelibs/library/internal/ChangeLog;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lit/gmariotti/changelibs/library/internal/ChangeLog;)V
    .registers 6
    .param p1, "chg"    # Lit/gmariotti/changelibs/library/internal/ChangeLog;

    .prologue
    .line 190
    if-eqz p1, :cond_16

    .line 191
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_17

    .line 192
    iget-object v2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    invoke-virtual {p1}, Lit/gmariotti/changelibs/library/internal/ChangeLog;->getRows()Ljava/util/LinkedList;

    move-result-object v3

    invoke-virtual {v2, v3}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->addAll(Ljava/util/Collection;)V

    .line 200
    :cond_11
    iget-object v2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    invoke-virtual {v2}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->notifyDataSetChanged()V

    .line 202
    :cond_16
    return-void

    .line 194
    :cond_17
    invoke-virtual {p1}, Lit/gmariotti/changelibs/library/internal/ChangeLog;->getRows()Ljava/util/LinkedList;

    move-result-object v2

    if-eqz v2, :cond_11

    .line 195
    invoke-virtual {p1}, Lit/gmariotti/changelibs/library/internal/ChangeLog;->getRows()Ljava/util/LinkedList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_25
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;

    .line 196
    .local v1, "row":Lit/gmariotti/changelibs/library/internal/ChangeLogRow;
    iget-object v2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    invoke-virtual {v2, v1}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->add(Ljava/lang/Object;)V

    goto :goto_25
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 163
    check-cast p1, Lit/gmariotti/changelibs/library/internal/ChangeLog;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lit/gmariotti/changelibs/library/view/ChangeLogListView$ParseAsyncTask;->onPostExecute(Lit/gmariotti/changelibs/library/internal/ChangeLog;)V

    return-void
.end method
