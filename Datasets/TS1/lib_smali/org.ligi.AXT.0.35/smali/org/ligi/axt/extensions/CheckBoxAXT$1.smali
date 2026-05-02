.class Lorg/ligi/axt/extensions/CheckBoxAXT$1;
.super Ljava/lang/Object;
.source "CheckBoxAXT.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/ligi/axt/extensions/CheckBoxAXT;->careForCheckedStatePersistence(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/ligi/axt/extensions/CheckBoxAXT;

.field final synthetic val$mSharedPrefs:Landroid/content/SharedPreferences;

.field final synthetic val$tag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/ligi/axt/extensions/CheckBoxAXT;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 4
    .param p1, "this$0"    # Lorg/ligi/axt/extensions/CheckBoxAXT;

    .prologue
    .line 27
    iput-object p1, p0, Lorg/ligi/axt/extensions/CheckBoxAXT$1;->this$0:Lorg/ligi/axt/extensions/CheckBoxAXT;

    iput-object p2, p0, Lorg/ligi/axt/extensions/CheckBoxAXT$1;->val$mSharedPrefs:Landroid/content/SharedPreferences;

    iput-object p3, p0, Lorg/ligi/axt/extensions/CheckBoxAXT$1;->val$tag:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 30
    iget-object v0, p0, Lorg/ligi/axt/extensions/CheckBoxAXT$1;->val$mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lorg/ligi/axt/extensions/CheckBoxAXT$1;->val$tag:Ljava/lang/String;

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 31
    return-void
.end method
