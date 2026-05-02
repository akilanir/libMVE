.class Lcom/devspark/appmsg/MsgManager;
.super Landroid/os/Handler;
.source "MsgManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/devspark/appmsg/MsgManager$1;,
        Lcom/devspark/appmsg/MsgManager$ReleaseCallbacksIcs;,
        Lcom/devspark/appmsg/MsgManager$ReleaseCallbacks;,
        Lcom/devspark/appmsg/MsgManager$OutAnimationListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/Handler;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/devspark/appmsg/AppMsg;",
        ">;"
    }
.end annotation


# static fields
.field private static final MESSAGE_ADD_VIEW:I = -0x3dff8b23

.field private static final MESSAGE_DISPLAY:I = 0xc2007

.field private static final MESSAGE_REMOVE:I = -0x3dff821f

.field private static sManagers:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/app/Activity;",
            "Lcom/devspark/appmsg/MsgManager;",
            ">;"
        }
    .end annotation
.end field

.field private static sReleaseCallbacks:Lcom/devspark/appmsg/MsgManager$ReleaseCallbacks;


# instance fields
.field private final msgQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/devspark/appmsg/AppMsg;",
            ">;"
        }
    .end annotation
.end field

.field private final stickyQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/devspark/appmsg/AppMsg;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    .line 60
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 61
    new-instance v0, Ljava/util/PriorityQueue;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v0, p0, Lcom/devspark/appmsg/MsgManager;->msgQueue:Ljava/util/Queue;

    .line 62
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/devspark/appmsg/MsgManager;->stickyQueue:Ljava/util/Queue;

    .line 63
    return-void
.end method

.method private addMsgToView(Lcom/devspark/appmsg/AppMsg;)V
    .registers 9
    .param p1, "appMsg"    # Lcom/devspark/appmsg/AppMsg;

    .prologue
    .line 220
    invoke-virtual {p1}, Lcom/devspark/appmsg/AppMsg;->getView()Landroid/view/View;

    move-result-object v4

    .line 221
    .local v4, "view":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    if-nez v5, :cond_17

    .line 222
    invoke-virtual {p1}, Lcom/devspark/appmsg/AppMsg;->getParent()Landroid/view/ViewGroup;

    move-result-object v3

    .line 223
    .local v3, "targetParent":Landroid/view/ViewGroup;
    invoke-virtual {p1}, Lcom/devspark/appmsg/AppMsg;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 224
    .local v2, "params":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v3, :cond_3e

    .line 225
    invoke-virtual {v3, v4, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 230
    .end local v2    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v3    # "targetParent":Landroid/view/ViewGroup;
    :cond_17
    :goto_17
    invoke-virtual {v4}, Landroid/view/View;->clearAnimation()V

    .line 231
    iget-object v5, p1, Lcom/devspark/appmsg/AppMsg;->mInAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4, v5}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 232
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eqz v5, :cond_29

    .line 233
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 236
    :cond_29
    invoke-virtual {p1}, Lcom/devspark/appmsg/AppMsg;->getDuration()I

    move-result v0

    .line 237
    .local v0, "duration":I
    const/4 v5, -0x1

    if-eq v0, v5, :cond_46

    .line 238
    const v5, -0x3dff821f

    invoke-virtual {p0, v5}, Lcom/devspark/appmsg/MsgManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 239
    .local v1, "msg":Landroid/os/Message;
    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 240
    int-to-long v5, v0

    invoke-virtual {p0, v1, v5, v6}, Lcom/devspark/appmsg/MsgManager;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 244
    .end local v1    # "msg":Landroid/os/Message;
    :goto_3d
    return-void

    .line 227
    .end local v0    # "duration":I
    .restart local v2    # "params":Landroid/view/ViewGroup$LayoutParams;
    .restart local v3    # "targetParent":Landroid/view/ViewGroup;
    :cond_3e
    invoke-virtual {p1}, Lcom/devspark/appmsg/AppMsg;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5, v4, v2}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_17

    .line 242
    .end local v2    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v3    # "targetParent":Landroid/view/ViewGroup;
    .restart local v0    # "duration":I
    :cond_46
    iget-object v5, p0, Lcom/devspark/appmsg/MsgManager;->stickyQueue:Ljava/util/Queue;

    iget-object v6, p0, Lcom/devspark/appmsg/MsgManager;->msgQueue:Ljava/util/Queue;

    invoke-interface {v6}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_3d
.end method

.method static declared-synchronized clearAll()V
    .registers 4

    .prologue
    .line 103
    const-class v3, Lcom/devspark/appmsg/MsgManager;

    monitor-enter v3

    :try_start_3
    sget-object v2, Lcom/devspark/appmsg/MsgManager;->sManagers:Ljava/util/WeakHashMap;

    if-eqz v2, :cond_2e

    .line 104
    sget-object v2, Lcom/devspark/appmsg/MsgManager;->sManagers:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 105
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/devspark/appmsg/MsgManager;>;"
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_29

    .line 106
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/devspark/appmsg/MsgManager;

    .line 107
    .local v1, "manager":Lcom/devspark/appmsg/MsgManager;
    if-eqz v1, :cond_22

    .line 108
    invoke-virtual {v1}, Lcom/devspark/appmsg/MsgManager;->clearAllMsg()V

    .line 110
    :cond_22
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V
    :try_end_25
    .catchall {:try_start_3 .. :try_end_25} :catchall_26

    goto :goto_11

    .line 103
    .end local v1    # "manager":Lcom/devspark/appmsg/MsgManager;
    :catchall_26
    move-exception v2

    monitor-exit v3

    throw v2

    .line 112
    :cond_29
    :try_start_29
    sget-object v2, Lcom/devspark/appmsg/MsgManager;->sManagers:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->clear()V
    :try_end_2e
    .catchall {:try_start_29 .. :try_end_2e} :catchall_26

    .line 114
    :cond_2e
    monitor-exit v3

    return-void
.end method

.method private displayMsg()V
    .registers 7

    .prologue
    .line 182
    iget-object v2, p0, Lcom/devspark/appmsg/MsgManager;->msgQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 198
    :cond_8
    :goto_8
    return-void

    .line 186
    :cond_9
    iget-object v2, p0, Lcom/devspark/appmsg/MsgManager;->msgQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/devspark/appmsg/AppMsg;

    .line 188
    .local v0, "appMsg":Lcom/devspark/appmsg/AppMsg;
    invoke-virtual {v0}, Lcom/devspark/appmsg/AppMsg;->isShowing()Z

    move-result v2

    if-nez v2, :cond_24

    .line 190
    const v2, -0x3dff8b23

    invoke-virtual {p0, v2}, Lcom/devspark/appmsg/MsgManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 191
    .local v1, "msg":Landroid/os/Message;
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 192
    invoke-virtual {p0, v1}, Lcom/devspark/appmsg/MsgManager;->sendMessage(Landroid/os/Message;)Z

    goto :goto_8

    .line 193
    .end local v1    # "msg":Landroid/os/Message;
    :cond_24
    invoke-virtual {v0}, Lcom/devspark/appmsg/AppMsg;->getDuration()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_8

    .line 194
    const v2, 0xc2007

    invoke-virtual {p0, v2}, Lcom/devspark/appmsg/MsgManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 195
    .restart local v1    # "msg":Landroid/os/Message;
    invoke-virtual {v0}, Lcom/devspark/appmsg/AppMsg;->getDuration()I

    move-result v2

    int-to-long v2, v2

    iget-object v4, v0, Lcom/devspark/appmsg/AppMsg;->mInAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v4

    add-long/2addr v2, v4

    iget-object v4, v0, Lcom/devspark/appmsg/AppMsg;->mOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v4}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v4

    add-long/2addr v2, v4

    invoke-virtual {p0, v1, v2, v3}, Lcom/devspark/appmsg/MsgManager;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_8
.end method

.method static ensureReleaseOnDestroy(Landroid/app/Activity;)V
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 83
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_7

    .line 90
    :goto_6
    return-void

    .line 86
    :cond_7
    sget-object v0, Lcom/devspark/appmsg/MsgManager;->sReleaseCallbacks:Lcom/devspark/appmsg/MsgManager$ReleaseCallbacks;

    if-nez v0, :cond_12

    .line 87
    new-instance v0, Lcom/devspark/appmsg/MsgManager$ReleaseCallbacksIcs;

    invoke-direct {v0}, Lcom/devspark/appmsg/MsgManager$ReleaseCallbacksIcs;-><init>()V

    sput-object v0, Lcom/devspark/appmsg/MsgManager;->sReleaseCallbacks:Lcom/devspark/appmsg/MsgManager$ReleaseCallbacks;

    .line 89
    :cond_12
    sget-object v0, Lcom/devspark/appmsg/MsgManager;->sReleaseCallbacks:Lcom/devspark/appmsg/MsgManager$ReleaseCallbacks;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/devspark/appmsg/MsgManager$ReleaseCallbacks;->register(Landroid/app/Application;)V

    goto :goto_6
.end method

.method static inverseCompareInt(II)I
    .registers 3
    .param p0, "lhs"    # I
    .param p1, "rhs"    # I

    .prologue
    .line 273
    if-ge p0, p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    if-ne p0, p1, :cond_8

    const/4 v0, 0x0

    goto :goto_3

    :cond_8
    const/4 v0, -0x1

    goto :goto_3
.end method

.method static declared-synchronized obtain(Landroid/app/Activity;)Lcom/devspark/appmsg/MsgManager;
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 69
    const-class v2, Lcom/devspark/appmsg/MsgManager;

    monitor-enter v2

    :try_start_3
    sget-object v1, Lcom/devspark/appmsg/MsgManager;->sManagers:Ljava/util/WeakHashMap;

    if-nez v1, :cond_f

    .line 70
    new-instance v1, Ljava/util/WeakHashMap;

    const/4 v3, 0x1

    invoke-direct {v1, v3}, Ljava/util/WeakHashMap;-><init>(I)V

    sput-object v1, Lcom/devspark/appmsg/MsgManager;->sManagers:Ljava/util/WeakHashMap;

    .line 72
    :cond_f
    sget-object v1, Lcom/devspark/appmsg/MsgManager;->sManagers:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/devspark/appmsg/MsgManager;

    .line 73
    .local v0, "manager":Lcom/devspark/appmsg/MsgManager;
    if-nez v0, :cond_26

    .line 74
    new-instance v0, Lcom/devspark/appmsg/MsgManager;

    .end local v0    # "manager":Lcom/devspark/appmsg/MsgManager;
    invoke-direct {v0}, Lcom/devspark/appmsg/MsgManager;-><init>()V

    .line 75
    .restart local v0    # "manager":Lcom/devspark/appmsg/MsgManager;
    invoke-static {p0}, Lcom/devspark/appmsg/MsgManager;->ensureReleaseOnDestroy(Landroid/app/Activity;)V

    .line 76
    sget-object v1, Lcom/devspark/appmsg/MsgManager;->sManagers:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_28

    .line 79
    :cond_26
    monitor-exit v2

    return-object v0

    .line 69
    .end local v0    # "manager":Lcom/devspark/appmsg/MsgManager;
    :catchall_28
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method static obtainShowing(Ljava/util/Collection;Ljava/util/Collection;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/devspark/appmsg/AppMsg;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lcom/devspark/appmsg/AppMsg;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 171
    .local p0, "from":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/devspark/appmsg/AppMsg;>;"
    .local p1, "appendTo":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/devspark/appmsg/AppMsg;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/devspark/appmsg/AppMsg;

    .line 172
    .local v1, "msg":Lcom/devspark/appmsg/AppMsg;
    invoke-virtual {v1}, Lcom/devspark/appmsg/AppMsg;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 173
    invoke-interface {p1, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 176
    .end local v1    # "msg":Lcom/devspark/appmsg/AppMsg;
    :cond_1a
    return-void
.end method

.method static declared-synchronized release(Landroid/app/Activity;)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 94
    const-class v2, Lcom/devspark/appmsg/MsgManager;

    monitor-enter v2

    :try_start_3
    sget-object v1, Lcom/devspark/appmsg/MsgManager;->sManagers:Ljava/util/WeakHashMap;

    if-eqz v1, :cond_14

    .line 95
    sget-object v1, Lcom/devspark/appmsg/MsgManager;->sManagers:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/devspark/appmsg/MsgManager;

    .line 96
    .local v0, "manager":Lcom/devspark/appmsg/MsgManager;
    if-eqz v0, :cond_14

    .line 97
    invoke-virtual {v0}, Lcom/devspark/appmsg/MsgManager;->clearAllMsg()V
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_16

    .line 100
    .end local v0    # "manager":Lcom/devspark/appmsg/MsgManager;
    :cond_14
    monitor-exit v2

    return-void

    .line 94
    :catchall_16
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private removeMsg(Lcom/devspark/appmsg/AppMsg;)V
    .registers 8
    .param p1, "appMsg"    # Lcom/devspark/appmsg/AppMsg;

    .prologue
    .line 206
    invoke-virtual {p0, p1}, Lcom/devspark/appmsg/MsgManager;->clearMsg(Lcom/devspark/appmsg/AppMsg;)V

    .line 207
    invoke-virtual {p1}, Lcom/devspark/appmsg/AppMsg;->getView()Landroid/view/View;

    move-result-object v2

    .line 208
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 209
    .local v1, "parent":Landroid/view/ViewGroup;
    if-eqz v1, :cond_22

    .line 210
    iget-object v3, p1, Lcom/devspark/appmsg/AppMsg;->mOutAnimation:Landroid/view/animation/Animation;

    new-instance v4, Lcom/devspark/appmsg/MsgManager$OutAnimationListener;

    const/4 v5, 0x0

    invoke-direct {v4, p1, v5}, Lcom/devspark/appmsg/MsgManager$OutAnimationListener;-><init>(Lcom/devspark/appmsg/AppMsg;Lcom/devspark/appmsg/MsgManager$1;)V

    invoke-virtual {v3, v4}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 211
    invoke-virtual {v2}, Landroid/view/View;->clearAnimation()V

    .line 212
    iget-object v3, p1, Lcom/devspark/appmsg/AppMsg;->mOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v2, v3}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 215
    :cond_22
    const v3, 0xc2007

    invoke-virtual {p0, v3}, Lcom/devspark/appmsg/MsgManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 216
    .local v0, "msg":Landroid/os/Message;
    invoke-virtual {p0, v0}, Lcom/devspark/appmsg/MsgManager;->sendMessage(Landroid/os/Message;)Z

    .line 217
    return-void
.end method


# virtual methods
.method add(Lcom/devspark/appmsg/AppMsg;)V
    .registers 4
    .param p1, "appMsg"    # Lcom/devspark/appmsg/AppMsg;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/devspark/appmsg/MsgManager;->msgQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 123
    iget-object v0, p1, Lcom/devspark/appmsg/AppMsg;->mInAnimation:Landroid/view/animation/Animation;

    if-nez v0, :cond_15

    .line 124
    invoke-virtual {p1}, Lcom/devspark/appmsg/AppMsg;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/high16 v1, 0x10a0000

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p1, Lcom/devspark/appmsg/AppMsg;->mInAnimation:Landroid/view/animation/Animation;

    .line 127
    :cond_15
    iget-object v0, p1, Lcom/devspark/appmsg/AppMsg;->mOutAnimation:Landroid/view/animation/Animation;

    if-nez v0, :cond_26

    .line 128
    invoke-virtual {p1}, Lcom/devspark/appmsg/AppMsg;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x10a0001

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p1, Lcom/devspark/appmsg/AppMsg;->mOutAnimation:Landroid/view/animation/Animation;

    .line 131
    :cond_26
    invoke-direct {p0}, Lcom/devspark/appmsg/MsgManager;->displayMsg()V

    .line 132
    return-void
.end method

.method clearAllMsg()V
    .registers 2

    .prologue
    .line 153
    const v0, 0xc2007

    invoke-virtual {p0, v0}, Lcom/devspark/appmsg/MsgManager;->removeMessages(I)V

    .line 154
    const v0, -0x3dff8b23

    invoke-virtual {p0, v0}, Lcom/devspark/appmsg/MsgManager;->removeMessages(I)V

    .line 155
    const v0, -0x3dff821f

    invoke-virtual {p0, v0}, Lcom/devspark/appmsg/MsgManager;->removeMessages(I)V

    .line 156
    invoke-virtual {p0}, Lcom/devspark/appmsg/MsgManager;->clearShowing()V

    .line 157
    iget-object v0, p0, Lcom/devspark/appmsg/MsgManager;->msgQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 158
    iget-object v0, p0, Lcom/devspark/appmsg/MsgManager;->stickyQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 159
    return-void
.end method

.method clearMsg(Lcom/devspark/appmsg/AppMsg;)V
    .registers 3
    .param p1, "appMsg"    # Lcom/devspark/appmsg/AppMsg;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/devspark/appmsg/MsgManager;->msgQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lcom/devspark/appmsg/MsgManager;->stickyQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 140
    :cond_10
    const v0, 0xc2007

    invoke-virtual {p0, v0, p1}, Lcom/devspark/appmsg/MsgManager;->removeMessages(ILjava/lang/Object;)V

    .line 141
    const v0, -0x3dff8b23

    invoke-virtual {p0, v0, p1}, Lcom/devspark/appmsg/MsgManager;->removeMessages(ILjava/lang/Object;)V

    .line 142
    const v0, -0x3dff821f

    invoke-virtual {p0, v0, p1}, Lcom/devspark/appmsg/MsgManager;->removeMessages(ILjava/lang/Object;)V

    .line 143
    iget-object v0, p0, Lcom/devspark/appmsg/MsgManager;->msgQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 144
    iget-object v0, p0, Lcom/devspark/appmsg/MsgManager;->stickyQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 145
    invoke-direct {p0, p1}, Lcom/devspark/appmsg/MsgManager;->removeMsg(Lcom/devspark/appmsg/AppMsg;)V

    .line 147
    :cond_2f
    return-void
.end method

.method clearShowing()V
    .registers 5

    .prologue
    .line 162
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 163
    .local v2, "showing":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/devspark/appmsg/AppMsg;>;"
    iget-object v3, p0, Lcom/devspark/appmsg/MsgManager;->msgQueue:Ljava/util/Queue;

    invoke-static {v3, v2}, Lcom/devspark/appmsg/MsgManager;->obtainShowing(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 164
    iget-object v3, p0, Lcom/devspark/appmsg/MsgManager;->stickyQueue:Ljava/util/Queue;

    invoke-static {v3, v2}, Lcom/devspark/appmsg/MsgManager;->obtainShowing(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 165
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/devspark/appmsg/AppMsg;

    .line 166
    .local v1, "msg":Lcom/devspark/appmsg/AppMsg;
    invoke-virtual {p0, v1}, Lcom/devspark/appmsg/MsgManager;->clearMsg(Lcom/devspark/appmsg/AppMsg;)V

    goto :goto_13

    .line 168
    .end local v1    # "msg":Lcom/devspark/appmsg/AppMsg;
    :cond_23
    return-void
.end method

.method public compare(Lcom/devspark/appmsg/AppMsg;Lcom/devspark/appmsg/AppMsg;)I
    .registers 5
    .param p1, "lhs"    # Lcom/devspark/appmsg/AppMsg;
    .param p2, "rhs"    # Lcom/devspark/appmsg/AppMsg;

    .prologue
    .line 269
    iget v0, p1, Lcom/devspark/appmsg/AppMsg;->mPriority:I

    iget v1, p2, Lcom/devspark/appmsg/AppMsg;->mPriority:I

    invoke-static {v0, v1}, Lcom/devspark/appmsg/MsgManager;->inverseCompareInt(II)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 48
    check-cast p1, Lcom/devspark/appmsg/AppMsg;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/devspark/appmsg/AppMsg;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/devspark/appmsg/MsgManager;->compare(Lcom/devspark/appmsg/AppMsg;Lcom/devspark/appmsg/AppMsg;)I

    move-result v0

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 249
    iget v1, p1, Landroid/os/Message;->what:I

    sparse-switch v1, :sswitch_data_1e

    .line 262
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 265
    :goto_8
    return-void

    .line 251
    :sswitch_9
    invoke-direct {p0}, Lcom/devspark/appmsg/MsgManager;->displayMsg()V

    goto :goto_8

    .line 254
    :sswitch_d
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/devspark/appmsg/AppMsg;

    .line 255
    .local v0, "appMsg":Lcom/devspark/appmsg/AppMsg;
    invoke-direct {p0, v0}, Lcom/devspark/appmsg/MsgManager;->addMsgToView(Lcom/devspark/appmsg/AppMsg;)V

    goto :goto_8

    .line 258
    .end local v0    # "appMsg":Lcom/devspark/appmsg/AppMsg;
    :sswitch_15
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/devspark/appmsg/AppMsg;

    .line 259
    .restart local v0    # "appMsg":Lcom/devspark/appmsg/AppMsg;
    invoke-direct {p0, v0}, Lcom/devspark/appmsg/MsgManager;->removeMsg(Lcom/devspark/appmsg/AppMsg;)V

    goto :goto_8

    .line 249
    nop

    :sswitch_data_1e
    .sparse-switch
        -0x3dff8b23 -> :sswitch_d
        -0x3dff821f -> :sswitch_15
        0xc2007 -> :sswitch_9
    .end sparse-switch
.end method
