.class Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;
.super Ljava/lang/Object;
.source "SwitchPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Listener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;


# direct methods
.method private constructor <init>(Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;)V
    .registers 2

    .prologue
    .line 32
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;->this$0:Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;
    .param p2, "x1"    # Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$1;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;-><init>(Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;)V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 37
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;->this$0:Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    # invokes: Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->callChangeListener(Ljava/lang/Object;)Z
    invoke-static {v0, v1}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->access$100(Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 41
    if-nez p2, :cond_13

    const/4 v0, 0x1

    :goto_f
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 46
    :goto_12
    return-void

    .line 41
    :cond_13
    const/4 v0, 0x0

    goto :goto_f

    .line 45
    :cond_15
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener;->this$0:Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;

    invoke-virtual {v0, p2}, Lcom/lb/material_preferences_library/custom_preferences/SwitchPreference;->setChecked(Z)V

    goto :goto_12
.end method
