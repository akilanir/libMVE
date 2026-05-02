.class Lcom/lb/material_preferences_library/PreferenceActivity$1;
.super Ljava/lang/Object;
.source "PreferenceActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lb/material_preferences_library/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lb/material_preferences_library/PreferenceActivity;


# direct methods
.method constructor <init>(Lcom/lb/material_preferences_library/PreferenceActivity;)V
    .registers 2

    .prologue
    .line 54
    iput-object p1, p0, Lcom/lb/material_preferences_library/PreferenceActivity$1;->this$0:Lcom/lb/material_preferences_library/PreferenceActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/lb/material_preferences_library/PreferenceActivity$1;->this$0:Lcom/lb/material_preferences_library/PreferenceActivity;

    invoke-virtual {v0}, Lcom/lb/material_preferences_library/PreferenceActivity;->finish()V

    .line 59
    return-void
.end method
