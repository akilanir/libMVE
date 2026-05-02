.class public Lfreemarker/core/CustomAttribute;
.super Ljava/lang/Object;
.source "CustomAttribute.java"


# static fields
.field public static final SCOPE_CONFIGURATION:I = 0x2

.field public static final SCOPE_ENVIRONMENT:I = 0x0

.field public static final SCOPE_TEMPLATE:I = 0x1


# instance fields
.field private final key:Ljava/lang/Object;

.field private final scope:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "scope"    # I

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lfreemarker/core/CustomAttribute;->key:Ljava/lang/Object;

    .line 94
    if-eqz p1, :cond_18

    const/4 v0, 0x1

    if-eq p1, v0, :cond_18

    const/4 v0, 0x2

    if-eq p1, v0, :cond_18

    .line 97
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 99
    :cond_18
    iput p1, p0, Lfreemarker/core/CustomAttribute;->scope:I

    .line 100
    return-void
.end method

.method private getScopeConfigurable()Lfreemarker/core/Configurable;
    .registers 4

    .prologue
    .line 164
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v0

    .line 165
    .local v0, "c":Lfreemarker/core/Configurable;
    if-nez v0, :cond_e

    .line 166
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No current environment"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 168
    :cond_e
    iget v1, p0, Lfreemarker/core/CustomAttribute;->scope:I

    packed-switch v1, :pswitch_data_28

    .line 179
    new-instance v1, Ljava/lang/Error;

    invoke-direct {v1}, Ljava/lang/Error;-><init>()V

    throw v1

    .line 173
    :pswitch_19
    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getParent()Lfreemarker/core/Configurable;

    move-result-object v0

    .line 176
    .end local v0    # "c":Lfreemarker/core/Configurable;
    :goto_1d
    :pswitch_1d
    return-object v0

    .restart local v0    # "c":Lfreemarker/core/Configurable;
    :pswitch_1e
    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getParent()Lfreemarker/core/Configurable;

    move-result-object v1

    invoke-virtual {v1}, Lfreemarker/core/Configurable;->getParent()Lfreemarker/core/Configurable;

    move-result-object v0

    goto :goto_1d

    .line 168
    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_19
        :pswitch_1e
    .end packed-switch
.end method


# virtual methods
.method protected create()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 109
    const/4 v0, 0x0

    return-object v0
.end method

.method public final get()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 119
    invoke-direct {p0}, Lfreemarker/core/CustomAttribute;->getScopeConfigurable()Lfreemarker/core/Configurable;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/CustomAttribute;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1, p0}, Lfreemarker/core/Configurable;->getCustomAttribute(Ljava/lang/Object;Lfreemarker/core/CustomAttribute;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final get(Lfreemarker/template/Template;)Ljava/lang/Object;
    .registers 4
    .param p1, "t"    # Lfreemarker/template/Template;

    .prologue
    .line 130
    iget v0, p0, Lfreemarker/core/CustomAttribute;->scope:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_d

    .line 131
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This is not a template-scope attribute"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_d
    iget-object v0, p0, Lfreemarker/core/CustomAttribute;->key:Ljava/lang/Object;

    invoke-virtual {p1, v0, p0}, Lfreemarker/core/Configurable;->getCustomAttribute(Ljava/lang/Object;Lfreemarker/core/CustomAttribute;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final set(Ljava/lang/Object;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 144
    invoke-direct {p0}, Lfreemarker/core/CustomAttribute;->getScopeConfigurable()Lfreemarker/core/Configurable;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/CustomAttribute;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1, p1}, Lfreemarker/core/Configurable;->setCustomAttribute(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 145
    return-void
.end method

.method public final set(Ljava/lang/Object;Lfreemarker/template/Template;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "t"    # Lfreemarker/template/Template;

    .prologue
    .line 157
    iget v0, p0, Lfreemarker/core/CustomAttribute;->scope:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_d

    .line 158
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This is not a template-scope attribute"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 160
    :cond_d
    iget-object v0, p0, Lfreemarker/core/CustomAttribute;->key:Ljava/lang/Object;

    invoke-virtual {p2, v0, p1}, Lfreemarker/core/Configurable;->setCustomAttribute(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 161
    return-void
.end method
