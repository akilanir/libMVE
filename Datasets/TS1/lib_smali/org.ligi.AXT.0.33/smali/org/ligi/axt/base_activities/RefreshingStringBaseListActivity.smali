.class public abstract Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;
.super Landroid/app/ListActivity;
.source "RefreshingStringBaseListActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;
    }
.end annotation


# instance fields
.field private adapter:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;

.field final mHandler:Landroid/os/Handler;

.field final mUpdateResults:Ljava/lang/Runnable;

.field private running:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->running:Z

    .line 98
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->mHandler:Landroid/os/Handler;

    .line 100
    new-instance v0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$1;

    invoke-direct {v0, p0}, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$1;-><init>(Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;)V

    iput-object v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->mUpdateResults:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;)Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;
    .registers 2
    .param p0, "x0"    # Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;

    .prologue
    .line 34
    iget-object v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->adapter:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;

    return-object v0
.end method


# virtual methods
.method public getRefreshSleep()I
    .registers 2

    .prologue
    .line 107
    const/16 v0, 0x64

    return v0
.end method

.method public abstract getStringByPosition(I)Ljava/lang/String;
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 43
    new-instance v0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;

    invoke-direct {v0, p0, p0}, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;-><init>(Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;Landroid/app/Activity;)V

    iput-object v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->adapter:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;

    .line 44
    iget-object v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->adapter:Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter;

    invoke-virtual {p0, v0}, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 46
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 47
    return-void
.end method

.method protected onDestroy()V
    .registers 2

    .prologue
    .line 94
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->running:Z

    .line 95
    invoke-super {p0}, Landroid/app/ListActivity;->onDestroy()V

    .line 96
    return-void
.end method

.method public run()V
    .registers 4

    .prologue
    .line 111
    :goto_0
    iget-boolean v1, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->running:Z

    if-eqz v1, :cond_19

    .line 112
    iget-object v1, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->mUpdateResults:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 114
    :try_start_b
    invoke-virtual {p0}, Lorg/ligi/axt/base_activities/RefreshingStringBaseListActivity;->getRefreshSleep()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_13
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_13} :catch_14

    goto :goto_0

    .line 115
    :catch_14
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 119
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_19
    return-void
.end method
