.class Lcom/rey/material/widget/SnackBar$1;
.super Ljava/lang/Object;
.source "SnackBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/SnackBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/SnackBar;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/SnackBar;)V
    .registers 2

    .prologue
    .line 55
    iput-object p1, p0, Lcom/rey/material/widget/SnackBar$1;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$1;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-virtual {v0}, Lcom/rey/material/widget/SnackBar;->dismiss()V

    .line 59
    return-void
.end method
