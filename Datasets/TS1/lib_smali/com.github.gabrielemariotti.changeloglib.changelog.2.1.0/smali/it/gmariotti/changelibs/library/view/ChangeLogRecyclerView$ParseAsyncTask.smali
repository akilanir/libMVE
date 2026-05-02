.class public Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask;
.super Landroid/os/AsyncTask;
.source "ChangeLogRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView;
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
.field private mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;

.field private mParse:Lit/gmariotti/changelibs/library/parser/XmlParser;

.field final synthetic this$0:Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView;


# direct methods
.method public constructor <init>(Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView;Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;Lit/gmariotti/changelibs/library/parser/XmlParser;)V
    .registers 4
    .param p2, "adapter"    # Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;
    .param p3, "parse"    # Lit/gmariotti/changelibs/library/parser/XmlParser;

    .prologue
    .line 183
    iput-object p1, p0, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask;->this$0:Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 184
    iput-object p2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;

    .line 185
    iput-object p3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask;->mParse:Lit/gmariotti/changelibs/library/parser/XmlParser;

    .line 186
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .registers 7
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 192
    :try_start_0
    iget-object v2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask;->mParse:Lit/gmariotti/changelibs/library/parser/XmlParser;

    if-eqz v2, :cond_1d

    .line 193
    iget-object v2, p0, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask;->mParse:Lit/gmariotti/changelibs/library/parser/XmlParser;

    invoke-virtual {v2}, Lit/gmariotti/changelibs/library/parser/XmlParser;->readChangeLogFile()Lit/gmariotti/changelibs/library/internal/ChangeLog;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v0

    .line 199
    :goto_a
    return-object v0

    .line 196
    :catch_b
    move-exception v1

    .line 197
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView;->TAG:Ljava/lang/String;

    iget-object v3, p0, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask;->this$0:Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView;

    invoke-virtual {v3}, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lit/gmariotti/changelibs/R$string;->changelog_internal_error_parsing:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 199
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1d
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 178
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask;->doInBackground([Ljava/lang/Void;)Lit/gmariotti/changelibs/library/internal/ChangeLog;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lit/gmariotti/changelibs/library/internal/ChangeLog;)V
    .registers 4
    .param p1, "chg"    # Lit/gmariotti/changelibs/library/internal/ChangeLog;

    .prologue
    .line 205
    if-eqz p1, :cond_b

    .line 206
    iget-object v0, p0, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask;->mAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;

    invoke-virtual {p1}, Lit/gmariotti/changelibs/library/internal/ChangeLog;->getRows()Ljava/util/LinkedList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->add(Ljava/util/LinkedList;)V

    .line 207
    :cond_b
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 178
    check-cast p1, Lit/gmariotti/changelibs/library/internal/ChangeLog;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lit/gmariotti/changelibs/library/view/ChangeLogRecyclerView$ParseAsyncTask;->onPostExecute(Lit/gmariotti/changelibs/library/internal/ChangeLog;)V

    return-void
.end method
