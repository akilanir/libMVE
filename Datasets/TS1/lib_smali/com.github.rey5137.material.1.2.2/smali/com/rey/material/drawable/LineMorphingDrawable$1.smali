.class Lcom/rey/material/drawable/LineMorphingDrawable$1;
.super Ljava/lang/Object;
.source "LineMorphingDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/LineMorphingDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/drawable/LineMorphingDrawable;


# direct methods
.method constructor <init>(Lcom/rey/material/drawable/LineMorphingDrawable;)V
    .registers 2

    .prologue
    .line 351
    iput-object p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$1;->this$0:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 355
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable$1;->this$0:Lcom/rey/material/drawable/LineMorphingDrawable;

    # invokes: Lcom/rey/material/drawable/LineMorphingDrawable;->update()V
    invoke-static {v0}, Lcom/rey/material/drawable/LineMorphingDrawable;->access$000(Lcom/rey/material/drawable/LineMorphingDrawable;)V

    .line 356
    return-void
.end method
