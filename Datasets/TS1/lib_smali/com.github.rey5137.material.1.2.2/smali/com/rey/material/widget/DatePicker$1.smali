.class Lcom/rey/material/widget/DatePicker$1;
.super Ljava/lang/Object;
.source "DatePicker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/DatePicker;->postSetSelectionFromTop(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/DatePicker;

.field final synthetic val$offset:I

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/rey/material/widget/DatePicker;II)V
    .registers 4

    .prologue
    .line 409
    iput-object p1, p0, Lcom/rey/material/widget/DatePicker$1;->this$0:Lcom/rey/material/widget/DatePicker;

    iput p2, p0, Lcom/rey/material/widget/DatePicker$1;->val$position:I

    iput p3, p0, Lcom/rey/material/widget/DatePicker$1;->val$offset:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 412
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$1;->this$0:Lcom/rey/material/widget/DatePicker;

    iget v1, p0, Lcom/rey/material/widget/DatePicker$1;->val$position:I

    iget v2, p0, Lcom/rey/material/widget/DatePicker$1;->val$offset:I

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/widget/DatePicker;->setSelectionFromTop(II)V

    .line 413
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$1;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v0}, Lcom/rey/material/widget/DatePicker;->requestLayout()V

    .line 414
    return-void
.end method
