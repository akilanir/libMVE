.class Lcom/rey/material/drawable/CheckBoxDrawable$1;
.super Ljava/lang/Object;
.source "CheckBoxDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/CheckBoxDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/drawable/CheckBoxDrawable;


# direct methods
.method constructor <init>(Lcom/rey/material/drawable/CheckBoxDrawable;)V
    .registers 2

    .prologue
    .line 332
    iput-object p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$1;->this$0:Lcom/rey/material/drawable/CheckBoxDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 336
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable$1;->this$0:Lcom/rey/material/drawable/CheckBoxDrawable;

    # invokes: Lcom/rey/material/drawable/CheckBoxDrawable;->update()V
    invoke-static {v0}, Lcom/rey/material/drawable/CheckBoxDrawable;->access$000(Lcom/rey/material/drawable/CheckBoxDrawable;)V

    .line 337
    return-void
.end method
