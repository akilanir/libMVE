.class Lcom/rey/material/drawable/OvalShadowDrawable$1;
.super Ljava/lang/Object;
.source "OvalShadowDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/OvalShadowDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/drawable/OvalShadowDrawable;


# direct methods
.method constructor <init>(Lcom/rey/material/drawable/OvalShadowDrawable;)V
    .registers 2

    .prologue
    .line 338
    iput-object p1, p0, Lcom/rey/material/drawable/OvalShadowDrawable$1;->this$0:Lcom/rey/material/drawable/OvalShadowDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 342
    iget-object v0, p0, Lcom/rey/material/drawable/OvalShadowDrawable$1;->this$0:Lcom/rey/material/drawable/OvalShadowDrawable;

    # invokes: Lcom/rey/material/drawable/OvalShadowDrawable;->update()V
    invoke-static {v0}, Lcom/rey/material/drawable/OvalShadowDrawable;->access$000(Lcom/rey/material/drawable/OvalShadowDrawable;)V

    .line 343
    return-void
.end method
