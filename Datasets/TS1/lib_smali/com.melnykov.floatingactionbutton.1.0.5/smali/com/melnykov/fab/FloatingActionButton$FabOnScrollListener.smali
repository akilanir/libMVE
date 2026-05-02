.class public Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;
.super Lcom/melnykov/fab/ScrollDirectionDetector;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melnykov/fab/FloatingActionButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FabOnScrollListener"
.end annotation


# instance fields
.field private mFloatingActionButton:Lcom/melnykov/fab/FloatingActionButton;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 297
    invoke-direct {p0}, Lcom/melnykov/fab/ScrollDirectionDetector;-><init>()V

    .line 298
    new-instance v0, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener$1;

    invoke-direct {v0, p0}, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener$1;-><init>(Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;)V

    invoke-virtual {p0, v0}, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;->setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V

    .line 307
    return-void
.end method

.method static synthetic access$100(Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;)Lcom/melnykov/fab/FloatingActionButton;
    .registers 2
    .param p0, "x0"    # Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;

    .prologue
    .line 294
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;->mFloatingActionButton:Lcom/melnykov/fab/FloatingActionButton;

    return-object v0
.end method


# virtual methods
.method public setFloatingActionButton(Lcom/melnykov/fab/FloatingActionButton;)V
    .registers 2
    .param p1, "floatingActionButton"    # Lcom/melnykov/fab/FloatingActionButton;

    .prologue
    .line 310
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;->mFloatingActionButton:Lcom/melnykov/fab/FloatingActionButton;

    .line 311
    return-void
.end method
