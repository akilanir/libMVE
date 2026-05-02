.class public Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;
.super Ljava/lang/Object;
.source "PauseOnScrollListener.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# instance fields
.field private final externalListener:Landroid/widget/AbsListView$OnScrollListener;

.field private imageLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;

.field private final pauseOnFling:Z

.field private final pauseOnScroll:Z


# direct methods
.method public constructor <init>(Lcom/nostra13/universalimageloader/core/ImageLoader;ZZ)V
    .registers 5
    .param p1, "imageLoader"    # Lcom/nostra13/universalimageloader/core/ImageLoader;
    .param p2, "pauseOnScroll"    # Z
    .param p3, "pauseOnFling"    # Z

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;-><init>(Lcom/nostra13/universalimageloader/core/ImageLoader;ZZLandroid/widget/AbsListView$OnScrollListener;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lcom/nostra13/universalimageloader/core/ImageLoader;ZZLandroid/widget/AbsListView$OnScrollListener;)V
    .registers 5
    .param p1, "imageLoader"    # Lcom/nostra13/universalimageloader/core/ImageLoader;
    .param p2, "pauseOnScroll"    # Z
    .param p3, "pauseOnFling"    # Z
    .param p4, "customListener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->imageLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;

    .line 65
    iput-boolean p2, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->pauseOnScroll:Z

    .line 66
    iput-boolean p3, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->pauseOnFling:Z

    .line 67
    iput-object p4, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->externalListener:Landroid/widget/AbsListView$OnScrollListener;

    .line 68
    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 6
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 94
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->externalListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_9

    .line 95
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->externalListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2, p3, p4}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    .line 97
    :cond_9
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 4
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 72
    packed-switch p2, :pswitch_data_28

    .line 87
    :cond_3
    :goto_3
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->externalListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_c

    .line 88
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->externalListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 90
    :cond_c
    return-void

    .line 74
    :pswitch_d
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->imageLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    goto :goto_3

    .line 77
    :pswitch_13
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->pauseOnScroll:Z

    if-eqz v0, :cond_3

    .line 78
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->imageLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->pause()V

    goto :goto_3

    .line 82
    :pswitch_1d
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->pauseOnFling:Z

    if-eqz v0, :cond_3

    .line 83
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;->imageLoader:Lcom/nostra13/universalimageloader/core/ImageLoader;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->pause()V

    goto :goto_3

    .line 72
    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_d
        :pswitch_13
        :pswitch_1d
    .end packed-switch
.end method
