.class public final Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;
.super Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;
.source "AnimatorSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;,
        Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;,
        Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;,
        Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;,
        Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$DependencyListener;
    }
.end annotation


# instance fields
.field private mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

.field private mDuration:J

.field private mNeedsSort:Z

.field private mNodeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;",
            "Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;",
            ">;"
        }
    .end annotation
.end field

.field private mNodes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;",
            ">;"
        }
    .end annotation
.end field

.field private mPlayingSet:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field private mSetListener:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

.field private mSortedNodes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;",
            ">;"
        }
    .end annotation
.end field

.field private mStartDelay:J

.field private mStarted:Z

.field mTerminated:Z


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;-><init>()V

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 90
    iput-object v2, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    .line 99
    iput-boolean v1, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    .line 105
    iput-boolean v1, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 108
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    .line 111
    iput-object v2, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    .line 117
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDuration:J

    .line 1010
    return-void
.end method

.method static synthetic access$000(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$200(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$302(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;
    .param p1, "x1"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    return p1
.end method

.method static synthetic access$400(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    return-object v0
.end method

.method private sortNodes()V
    .registers 15

    .prologue
    const/4 v13, 0x0

    .line 783
    iget-boolean v11, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    if-eqz v11, :cond_9c

    .line 784
    iget-object v11, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 785
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 786
    .local v9, "roots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;>;"
    iget-object v11, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 787
    .local v6, "numNodes":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_16
    if-ge v1, v6, :cond_32

    .line 788
    iget-object v11, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 789
    .local v3, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    if-eqz v11, :cond_2c

    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-nez v11, :cond_2f

    .line 790
    :cond_2c
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 787
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 793
    .end local v3    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_32
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 794
    .local v10, "tmpRoots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;>;"
    :goto_37
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-lez v11, :cond_84

    .line 795
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 796
    .local v7, "numRoots":I
    const/4 v1, 0x0

    :goto_42
    if-ge v1, v7, :cond_7a

    .line 797
    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 798
    .local v8, "root":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v11, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 799
    iget-object v11, v8, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    if-eqz v11, :cond_77

    .line 800
    iget-object v11, v8, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 801
    .local v5, "numDependents":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_5a
    if-ge v2, v5, :cond_77

    .line 802
    iget-object v11, v8, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 803
    .restart local v3    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 804
    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-nez v11, :cond_74

    .line 805
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 801
    :cond_74
    add-int/lit8 v2, v2, 0x1

    goto :goto_5a

    .line 796
    .end local v2    # "j":I
    .end local v3    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    .end local v5    # "numDependents":I
    :cond_77
    add-int/lit8 v1, v1, 0x1

    goto :goto_42

    .line 810
    .end local v8    # "root":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_7a
    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 811
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 812
    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    goto :goto_37

    .line 814
    .end local v7    # "numRoots":I
    :cond_84
    iput-boolean v13, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 815
    iget-object v11, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    iget-object v12, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-eq v11, v12, :cond_ee

    .line 816
    new-instance v11, Ljava/lang/IllegalStateException;

    const-string v12, "Circular dependencies cannot exist in AnimatorSet"

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 823
    .end local v1    # "i":I
    .end local v6    # "numNodes":I
    .end local v9    # "roots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;>;"
    .end local v10    # "tmpRoots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;>;"
    :cond_9c
    iget-object v11, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 824
    .restart local v6    # "numNodes":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_a3
    if-ge v1, v6, :cond_ee

    .line 825
    iget-object v11, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 826
    .restart local v3    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    if-eqz v11, :cond_e9

    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-lez v11, :cond_e9

    .line 827
    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 828
    .local v4, "numDependencies":I
    const/4 v2, 0x0

    .restart local v2    # "j":I
    :goto_c0
    if-ge v2, v4, :cond_e9

    .line 829
    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;

    .line 830
    .local v0, "dependency":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;
    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    if-nez v11, :cond_d5

    .line 831
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    .line 833
    :cond_d5
    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    iget-object v12, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_e6

    .line 834
    iget-object v11, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    iget-object v12, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 828
    :cond_e6
    add-int/lit8 v2, v2, 0x1

    goto :goto_c0

    .line 840
    .end local v0    # "dependency":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;
    .end local v2    # "j":I
    .end local v4    # "numDependencies":I
    :cond_e9
    iput-boolean v13, v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->done:Z

    .line 824
    add-int/lit8 v1, v1, 0x1

    goto :goto_a3

    .line 843
    .end local v3    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_ee
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 6

    .prologue
    .line 284
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    .line 285
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->isStarted()Z

    move-result v4

    if-eqz v4, :cond_74

    .line 286
    const/4 v3, 0x0

    .line 287
    .local v3, "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    if-eqz v4, :cond_2a

    .line 288
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    check-cast v3, Ljava/util/ArrayList;

    .line 289
    .restart local v3    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;

    .line 290
    .local v1, "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationCancel(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)V

    goto :goto_1a

    .line 293
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    :cond_2a
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    if-eqz v4, :cond_51

    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v4}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_51

    .line 296
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v4}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->cancel()V

    .line 302
    :cond_3b
    if-eqz v3, :cond_71

    .line 303
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_71

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;

    .line 304
    .restart local v1    # "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationEnd(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)V

    goto :goto_41

    .line 297
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    :cond_51
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_3b

    .line 298
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_5f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 299
    .local v2, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v4, v2, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v4}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->cancel()V

    goto :goto_5f

    .line 307
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_71
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 309
    .end local v3    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_74
    return-void
.end method

.method public bridge synthetic clone()Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;
    .registers 2

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->clone()Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;
    .registers 16

    .prologue
    const/4 v13, 0x0

    const/4 v14, 0x0

    .line 550
    invoke-super {p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->clone()Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    move-result-object v0

    check-cast v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;

    .line 559
    .local v0, "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;
    const/4 v12, 0x1

    iput-boolean v12, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 560
    iput-boolean v13, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    .line 561
    iput-boolean v13, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 562
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    iput-object v12, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;

    .line 563
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    iput-object v12, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;

    .line 564
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    iput-object v12, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    .line 565
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    iput-object v12, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    .line 570
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 571
    .local v11, "nodeCloneMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;>;"
    iget-object v12, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_36
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_9b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 572
    .local v9, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    invoke-virtual {v9}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->clone()Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    move-result-object v10

    .line 573
    .local v10, "nodeClone":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    invoke-virtual {v11, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 574
    iget-object v12, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 575
    iget-object v12, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;

    iget-object v13, v10, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v12, v13, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 577
    iput-object v14, v10, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    .line 578
    iput-object v14, v10, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->tmpDependencies:Ljava/util/ArrayList;

    .line 579
    iput-object v14, v10, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    .line 580
    iput-object v14, v10, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    .line 583
    iget-object v12, v10, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v12}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->getListeners()Ljava/util/ArrayList;

    move-result-object v2

    .line 584
    .local v2, "cloneListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    if-eqz v2, :cond_36

    .line 585
    const/4 v8, 0x0

    .line 586
    .local v8, "listenersToRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_6a
    :goto_6a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_85

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;

    .line 587
    .local v7, "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    instance-of v12, v7, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    if-eqz v12, :cond_6a

    .line 588
    if-nez v8, :cond_81

    .line 589
    new-instance v8, Ljava/util/ArrayList;

    .end local v8    # "listenersToRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 591
    .restart local v8    # "listenersToRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_81
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6a

    .line 594
    .end local v7    # "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    :cond_85
    if-eqz v8, :cond_36

    .line 595
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_8b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_36

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;

    .line 596
    .restart local v7    # "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_8b

    .line 603
    .end local v2    # "cloneListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v7    # "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    .end local v8    # "listenersToRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    .end local v9    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    .end local v10    # "nodeClone":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_9b
    iget-object v12, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_a1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_dc

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 604
    .restart local v9    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    invoke-virtual {v11, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 605
    .restart local v10    # "nodeClone":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v12, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    if-eqz v12, :cond_a1

    .line 606
    iget-object v12, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_bd
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_a1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;

    .line 607
    .local v4, "dependency":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;
    iget-object v12, v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 608
    .local v3, "clonedDependencyNode":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    new-instance v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;

    iget v12, v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;->rule:I

    invoke-direct {v1, v3, v12}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;-><init>(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;I)V

    .line 610
    .local v1, "cloneDependency":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;
    invoke-virtual {v10, v1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->addDependency(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;)V

    goto :goto_bd

    .line 615
    .end local v1    # "cloneDependency":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;
    .end local v3    # "clonedDependencyNode":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    .end local v4    # "dependency":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v9    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    .end local v10    # "nodeClone":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_dc
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->clone()Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;

    move-result-object v0

    return-object v0
.end method

.method public end()V
    .registers 7

    .prologue
    .line 319
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    .line 320
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->isStarted()Z

    move-result v4

    if-eqz v4, :cond_8b

    .line 321
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget-object v5, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-eq v4, v5, :cond_3f

    .line 323
    invoke-direct {p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->sortNodes()V

    .line 324
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_20
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 325
    .local v2, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    if-nez v4, :cond_37

    .line 326
    new-instance v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    invoke-direct {v4, p0, p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;-><init>(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;)V

    iput-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    .line 328
    :cond_37
    iget-object v4, v2, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    iget-object v5, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    invoke-virtual {v4, v5}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->addListener(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;)V

    goto :goto_20

    .line 331
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_3f
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    if-eqz v4, :cond_48

    .line 332
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v4}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->cancel()V

    .line 334
    :cond_48
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_68

    .line 335
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_56
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_68

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 336
    .restart local v2    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v4, v2, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v4}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->end()V

    goto :goto_56

    .line 339
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_68
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    if-eqz v4, :cond_88

    .line 340
    iget-object v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    .line 341
    invoke-virtual {v4}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 342
    .local v3, "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_78
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_88

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;

    .line 343
    .local v1, "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationEnd(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)V

    goto :goto_78

    .line 346
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    .end local v3    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_88
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 348
    :cond_8b
    return-void
.end method

.method public getChildAnimations()Ljava/util/ArrayList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;",
            ">;"
        }
    .end annotation

    .prologue
    .line 201
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 202
    .local v0, "childList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;>;"
    iget-object v3, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 203
    .local v2, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v3, v2, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 205
    .end local v2    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_1d
    return-object v0
.end method

.method public getDuration()J
    .registers 3

    .prologue
    .line 402
    iget-wide v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDuration:J

    return-wide v0
.end method

.method public getStartDelay()J
    .registers 3

    .prologue
    .line 378
    iget-wide v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    return-wide v0
.end method

.method public isRunning()Z
    .registers 4

    .prologue
    .line 357
    iget-object v2, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 358
    .local v1, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v2}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 359
    const/4 v2, 0x1

    .line 362
    .end local v1    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public isStarted()Z
    .registers 2

    .prologue
    .line 367
    iget-boolean v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    return v0
.end method

.method public play(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;
    .registers 3
    .param p1, "anim"    # Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    .prologue
    .line 269
    if-eqz p1, :cond_b

    .line 270
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 271
    new-instance v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    invoke-direct {v0, p0, p1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;-><init>(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)V

    .line 273
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public playSequentially(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;>;"
    const/4 v2, 0x1

    .line 180
    if-eqz p1, :cond_1b

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1b

    .line 181
    iput-boolean v2, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 182
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v2, :cond_1c

    .line 183
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {p0, v1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->play(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    .line 190
    :cond_1b
    return-void

    .line 185
    :cond_1c
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_1b

    .line 186
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {p0, v1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->play(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    move-result-object v2

    add-int/lit8 v1, v0, 0x1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v2, v1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;->before(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    .line 185
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d
.end method

.method public varargs playSequentially([Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)V
    .registers 5
    .param p1, "items"    # [Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    .prologue
    const/4 v2, 0x1

    .line 161
    if-eqz p1, :cond_e

    .line 162
    iput-boolean v2, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 163
    array-length v1, p1

    if-ne v1, v2, :cond_f

    .line 164
    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {p0, v1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->play(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    .line 171
    :cond_e
    return-void

    .line 166
    :cond_f
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_e

    .line 167
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->play(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    aget-object v2, p1, v2

    invoke-virtual {v1, v2}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;->before(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    .line 166
    add-int/lit8 v0, v0, 0x1

    goto :goto_10
.end method

.method public playTogether(Ljava/util/Collection;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p1, "items":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;>;"
    if-eqz p1, :cond_27

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v3

    if-lez v3, :cond_27

    .line 142
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 143
    const/4 v1, 0x0

    .line 144
    .local v1, "builder":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    .line 145
    .local v0, "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;
    if-nez v1, :cond_23

    .line 146
    invoke-virtual {p0, v0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->play(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    move-result-object v1

    goto :goto_10

    .line 148
    :cond_23
    invoke-virtual {v1, v0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;->with(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    goto :goto_10

    .line 152
    .end local v0    # "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;
    .end local v1    # "builder":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_27
    return-void
.end method

.method public varargs playTogether([Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)V
    .registers 5
    .param p1, "items"    # [Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    .prologue
    .line 126
    if-eqz p1, :cond_18

    .line 127
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 128
    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {p0, v2}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->play(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    move-result-object v0

    .line 129
    .local v0, "builder":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_d
    array-length v2, p1

    if-ge v1, v2, :cond_18

    .line 130
    aget-object v2, p1, v1

    invoke-virtual {v0, v2}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;->with(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;

    .line 129
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 133
    .end local v0    # "builder":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Builder;
    .end local v1    # "i":I
    :cond_18
    return-void
.end method

.method public bridge synthetic setDuration(J)Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;
    .registers 4

    .prologue
    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->setDuration(J)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;

    move-result-object v0

    return-object v0
.end method

.method public setDuration(J)Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;
    .registers 7
    .param p1, "duration"    # J

    .prologue
    .line 415
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-gez v2, :cond_e

    .line 416
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "duration must be a value of zero or greater"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 418
    :cond_e
    iget-object v2, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 421
    .local v1, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v2, p1, p2}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->setDuration(J)Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    goto :goto_14

    .line 423
    .end local v1    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_26
    iput-wide p1, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDuration:J

    .line 424
    return-object p0
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 5
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 235
    iget-object v2, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 236
    .local v1, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v2, p1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    goto :goto_6

    .line 238
    .end local v1    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_18
    return-void
.end method

.method public setStartDelay(J)V
    .registers 3
    .param p1, "startDelay"    # J

    .prologue
    .line 389
    iput-wide p1, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    .line 390
    return-void
.end method

.method public setTarget(Ljava/lang/Object;)V
    .registers 6
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 217
    iget-object v3, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 218
    .local v2, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v0, v2, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    .line 219
    .local v0, "animation":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;
    instance-of v3, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;

    if-eqz v3, :cond_1e

    .line 220
    check-cast v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;

    .end local v0    # "animation":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;
    invoke-virtual {v0, p1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    goto :goto_6

    .line 221
    .restart local v0    # "animation":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;
    :cond_1e
    instance-of v3, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ObjectAnimator;

    if-eqz v3, :cond_6

    .line 222
    check-cast v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ObjectAnimator;

    .end local v0    # "animation":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;
    invoke-virtual {v0, p1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    goto :goto_6

    .line 225
    .end local v2    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_28
    return-void
.end method

.method public setupEndValues()V
    .registers 4

    .prologue
    .line 436
    iget-object v2, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 437
    .local v1, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v2}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->setupEndValues()V

    goto :goto_6

    .line 439
    .end local v1    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_18
    return-void
.end method

.method public setupStartValues()V
    .registers 4

    .prologue
    .line 429
    iget-object v2, p0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 430
    .local v1, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    invoke-virtual {v2}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->setupStartValues()V

    goto :goto_6

    .line 432
    .end local v1    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_18
    return-void
.end method

.method public start()V
    .registers 21

    .prologue
    .line 450
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    .line 451
    const/16 v16, 0x1

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 455
    invoke-direct/range {p0 .. p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->sortNodes()V

    .line 457
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v13

    .line 458
    .local v13, "numSortedNodes":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1e
    if-ge v5, v13, :cond_6c

    .line 459
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 461
    .local v9, "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->getListeners()Ljava/util/ArrayList;

    move-result-object v14

    .line 462
    .local v14, "oldListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    if-eqz v14, :cond_69

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-lez v16, :cond_69

    .line 463
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v14}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 466
    .local v3, "clonedListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_47
    :goto_47
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_69

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;

    .line 467
    .local v8, "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    instance-of v0, v8, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$DependencyListener;

    move/from16 v16, v0

    if-nez v16, :cond_5f

    instance-of v0, v8, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    move/from16 v16, v0

    if-eqz v16, :cond_47

    .line 469
    :cond_5f
    iget-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->removeListener(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;)V

    goto :goto_47

    .line 458
    .end local v3    # "clonedListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "listener":Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;
    :cond_69
    add-int/lit8 v5, v5, 0x1

    goto :goto_1e

    .line 479
    .end local v9    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    .end local v14    # "oldListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_6c
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 480
    .local v10, "nodesToStart":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;>;"
    const/4 v5, 0x0

    :goto_72
    if-ge v5, v13, :cond_103

    .line 481
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 482
    .restart local v9    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    move-object/from16 v16, v0

    if-nez v16, :cond_9b

    .line 483
    new-instance v16, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;-><init>(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;)V

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    .line 485
    :cond_9b
    iget-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    if-eqz v16, :cond_ab

    iget-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-nez v16, :cond_be

    .line 486
    :cond_ab
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 496
    :goto_ae
    iget-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->addListener(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 480
    add-int/lit8 v5, v5, 0x1

    goto :goto_72

    .line 488
    :cond_be
    iget-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 489
    .local v11, "numDependencies":I
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_c7
    if-ge v7, v11, :cond_f4

    .line 490
    iget-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;

    .line 491
    .local v4, "dependency":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;
    iget-object v0, v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    move-object/from16 v16, v0

    new-instance v17, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$DependencyListener;

    iget v0, v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;->rule:I

    move/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move/from16 v2, v18

    invoke-direct {v0, v1, v9, v2}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$DependencyListener;-><init>(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;I)V

    invoke-virtual/range {v16 .. v17}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->addListener(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 489
    add-int/lit8 v7, v7, 0x1

    goto :goto_c7

    .line 494
    .end local v4    # "dependency":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Dependency;
    :cond_f4
    iget-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/ArrayList;

    move-object/from16 v0, v16

    iput-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->tmpDependencies:Ljava/util/ArrayList;

    goto :goto_ae

    .line 499
    .end local v7    # "j":I
    .end local v9    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    .end local v11    # "numDependencies":I
    :cond_103
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    move-wide/from16 v16, v0

    const-wide/16 v18, 0x0

    cmp-long v16, v16, v18

    if-gtz v16, :cond_134

    .line 500
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_113
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_173

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;

    .line 501
    .restart local v9    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;->start()V

    .line 502
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    iget-object v0, v9, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_113

    .line 505
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v9    # "node":Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$Node;
    :cond_134
    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [F

    move-object/from16 v16, v0

    fill-array-data v16, :array_1ea

    invoke-static/range {v16 .. v16}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    .line 506
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    move-wide/from16 v17, v0

    invoke-virtual/range {v16 .. v18}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    .line 507
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    move-object/from16 v16, v0

    new-instance v17, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v10}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet$1;-><init>(Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;Ljava/util/ArrayList;)V

    invoke-virtual/range {v16 .. v17}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 523
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->start()V

    .line 525
    :cond_173
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    if-eqz v16, :cond_19e

    .line 526
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    .line 527
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/ArrayList;

    .line 528
    .local v15, "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 529
    .local v12, "numListeners":I
    const/4 v5, 0x0

    :goto_18c
    if-ge v5, v12, :cond_19e

    .line 530
    invoke-virtual {v15, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationStart(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)V

    .line 529
    add-int/lit8 v5, v5, 0x1

    goto :goto_18c

    .line 533
    .end local v12    # "numListeners":I
    .end local v15    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_19e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-nez v16, :cond_1e9

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    move-wide/from16 v16, v0

    const-wide/16 v18, 0x0

    cmp-long v16, v16, v18

    if-nez v16, :cond_1e9

    .line 536
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 537
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    if-eqz v16, :cond_1e9

    .line 538
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/internal/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    .line 539
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/ArrayList;

    .line 540
    .restart local v15    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 541
    .restart local v12    # "numListeners":I
    const/4 v5, 0x0

    :goto_1d7
    if-ge v5, v12, :cond_1e9

    .line 542
    invoke-virtual {v15, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationEnd(Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator;)V

    .line 541
    add-int/lit8 v5, v5, 0x1

    goto :goto_1d7

    .line 546
    .end local v12    # "numListeners":I
    .end local v15    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_1e9
    return-void

    .line 505
    :array_1ea
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
