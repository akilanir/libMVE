.class public Lorg/ligi/axt/extensions/CheckBoxAXT;
.super Lorg/ligi/axt/extensions/ViewAXT;
.source "CheckBoxAXT.java"


# instance fields
.field private final checkBox:Landroid/widget/CheckBox;


# direct methods
.method public constructor <init>(Landroid/widget/CheckBox;)V
    .registers 2
    .param p1, "checkBox"    # Landroid/widget/CheckBox;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lorg/ligi/axt/extensions/ViewAXT;-><init>(Landroid/view/View;)V

    .line 14
    iput-object p1, p0, Lorg/ligi/axt/extensions/CheckBoxAXT;->checkBox:Landroid/widget/CheckBox;

    .line 15
    return-void
.end method


# virtual methods
.method public careForCheckedStatePersistence(Ljava/lang/String;)V
    .registers 6
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 23
    iget-object v1, p0, Lorg/ligi/axt/extensions/CheckBoxAXT;->checkBox:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "ui_state"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 25
    .local v0, "mSharedPrefs":Landroid/content/SharedPreferences;
    iget-object v1, p0, Lorg/ligi/axt/extensions/CheckBoxAXT;->checkBox:Landroid/widget/CheckBox;

    iget-object v2, p0, Lorg/ligi/axt/extensions/CheckBoxAXT;->checkBox:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    invoke-interface {v0, p1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 27
    iget-object v1, p0, Lorg/ligi/axt/extensions/CheckBoxAXT;->checkBox:Landroid/widget/CheckBox;

    new-instance v2, Lorg/ligi/axt/extensions/CheckBoxAXT$1;

    invoke-direct {v2, p0, v0, p1}, Lorg/ligi/axt/extensions/CheckBoxAXT$1;-><init>(Lorg/ligi/axt/extensions/CheckBoxAXT;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 33
    return-void
.end method
