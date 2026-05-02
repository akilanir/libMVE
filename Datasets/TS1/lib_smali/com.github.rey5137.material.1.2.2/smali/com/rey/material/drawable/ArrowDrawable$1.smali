.class Lcom/rey/material/drawable/ArrowDrawable$1;
.super Ljava/lang/Object;
.source "ArrowDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/ArrowDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/drawable/ArrowDrawable;


# direct methods
.method constructor <init>(Lcom/rey/material/drawable/ArrowDrawable;)V
    .registers 2

    .prologue
    .line 204
    iput-object p1, p0, Lcom/rey/material/drawable/ArrowDrawable$1;->this$0:Lcom/rey/material/drawable/ArrowDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 208
    iget-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable$1;->this$0:Lcom/rey/material/drawable/ArrowDrawable;

    # invokes: Lcom/rey/material/drawable/ArrowDrawable;->update()V
    invoke-static {v0}, Lcom/rey/material/drawable/ArrowDrawable;->access$000(Lcom/rey/material/drawable/ArrowDrawable;)V

    .line 209
    return-void
.end method
