.class Lcom/rey/material/drawable/RevealDrawable$1;
.super Ljava/lang/Object;
.source "RevealDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/RevealDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/drawable/RevealDrawable;


# direct methods
.method constructor <init>(Lcom/rey/material/drawable/RevealDrawable;)V
    .registers 2

    .prologue
    .line 243
    iput-object p1, p0, Lcom/rey/material/drawable/RevealDrawable$1;->this$0:Lcom/rey/material/drawable/RevealDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 247
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable$1;->this$0:Lcom/rey/material/drawable/RevealDrawable;

    # invokes: Lcom/rey/material/drawable/RevealDrawable;->update()V
    invoke-static {v0}, Lcom/rey/material/drawable/RevealDrawable;->access$000(Lcom/rey/material/drawable/RevealDrawable;)V

    .line 248
    return-void
.end method
