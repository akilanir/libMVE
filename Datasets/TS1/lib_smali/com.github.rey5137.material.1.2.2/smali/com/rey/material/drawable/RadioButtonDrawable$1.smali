.class Lcom/rey/material/drawable/RadioButtonDrawable$1;
.super Ljava/lang/Object;
.source "RadioButtonDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/RadioButtonDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/drawable/RadioButtonDrawable;


# direct methods
.method constructor <init>(Lcom/rey/material/drawable/RadioButtonDrawable;)V
    .registers 2

    .prologue
    .line 255
    iput-object p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$1;->this$0:Lcom/rey/material/drawable/RadioButtonDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 259
    iget-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable$1;->this$0:Lcom/rey/material/drawable/RadioButtonDrawable;

    # invokes: Lcom/rey/material/drawable/RadioButtonDrawable;->update()V
    invoke-static {v0}, Lcom/rey/material/drawable/RadioButtonDrawable;->access$000(Lcom/rey/material/drawable/RadioButtonDrawable;)V

    .line 260
    return-void
.end method
