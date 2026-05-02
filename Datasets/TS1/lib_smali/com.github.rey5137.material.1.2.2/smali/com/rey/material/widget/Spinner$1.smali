.class Lcom/rey/material/widget/Spinner$1;
.super Ljava/lang/Object;
.source "Spinner.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/Spinner;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/Spinner;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/Spinner;)V
    .registers 2

    .prologue
    .line 142
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$1;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$1;->this$0:Lcom/rey/material/widget/Spinner;

    # invokes: Lcom/rey/material/widget/Spinner;->showPopup()V
    invoke-static {v0}, Lcom/rey/material/widget/Spinner;->access$200(Lcom/rey/material/widget/Spinner;)V

    .line 146
    return-void
.end method
