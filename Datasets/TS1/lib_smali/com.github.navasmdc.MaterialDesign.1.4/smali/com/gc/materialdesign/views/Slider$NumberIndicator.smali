.class Lcom/gc/materialdesign/views/Slider$NumberIndicator;
.super Landroid/app/Dialog;
.source "Slider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gc/materialdesign/views/Slider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NumberIndicator"
.end annotation


# instance fields
.field indicator:Lcom/gc/materialdesign/views/Slider$Indicator;

.field numberIndicator:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/gc/materialdesign/views/Slider;


# direct methods
.method public constructor <init>(Lcom/gc/materialdesign/views/Slider;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 336
    iput-object p1, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    .line 337
    const v0, 0x103000f

    invoke-direct {p0, p2, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 338
    return-void
.end method


# virtual methods
.method public dismiss()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 364
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 365
    iget-object v0, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->indicator:Lcom/gc/materialdesign/views/Slider$Indicator;

    iput v1, v0, Lcom/gc/materialdesign/views/Slider$Indicator;->y:F

    .line 366
    iget-object v0, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->indicator:Lcom/gc/materialdesign/views/Slider$Indicator;

    iput v1, v0, Lcom/gc/materialdesign/views/Slider$Indicator;->size:F

    .line 367
    iget-object v0, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->indicator:Lcom/gc/materialdesign/views/Slider$Indicator;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/gc/materialdesign/views/Slider$Indicator;->animate:Z

    .line 368
    return-void
.end method

.method public onBackPressed()V
    .registers 1

    .prologue
    .line 372
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, -0x1

    .line 342
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->requestWindowFeature(I)Z

    .line 343
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 344
    sget v1, Lcom/gc/materialdesign/R$layout;->number_indicator_spinner:I

    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->setContentView(I)V

    .line 345
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->setCanceledOnTouchOutside(Z)V

    .line 347
    sget v1, Lcom/gc/materialdesign/R$id;->number_indicator_spinner_content:I

    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 349
    .local v0, "content":Landroid/widget/RelativeLayout;
    new-instance v1, Lcom/gc/materialdesign/views/Slider$Indicator;

    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/gc/materialdesign/views/Slider$Indicator;-><init>(Lcom/gc/materialdesign/views/Slider;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->indicator:Lcom/gc/materialdesign/views/Slider$Indicator;

    .line 350
    iget-object v1, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->indicator:Lcom/gc/materialdesign/views/Slider$Indicator;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 352
    new-instance v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->numberIndicator:Landroid/widget/TextView;

    .line 353
    iget-object v1, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->numberIndicator:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 354
    iget-object v1, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->numberIndicator:Landroid/widget/TextView;

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 355
    iget-object v1, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->numberIndicator:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 357
    iget-object v1, p0, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->indicator:Lcom/gc/materialdesign/views/Slider$Indicator;

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Lcom/gc/materialdesign/views/Slider$Indicator;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 360
    return-void
.end method
