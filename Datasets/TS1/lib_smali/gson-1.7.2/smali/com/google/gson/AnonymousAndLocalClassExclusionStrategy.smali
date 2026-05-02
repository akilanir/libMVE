.class final Lcom/google/gson/AnonymousAndLocalClassExclusionStrategy;
.super Ljava/lang/Object;
.source "AnonymousAndLocalClassExclusionStrategy.java"

# interfaces
.implements Lcom/google/gson/ExclusionStrategy;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private isAnonymousOrLocal(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/lang/Enum;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_16

    invoke-virtual {p1}, Ljava/lang/Class;->isAnonymousClass()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p1}, Ljava/lang/Class;->isLocalClass()Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method


# virtual methods
.method public shouldSkipClass(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1}, Lcom/google/gson/AnonymousAndLocalClassExclusionStrategy;->isAnonymousOrLocal(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public shouldSkipField(Lcom/google/gson/FieldAttributes;)Z
    .registers 3
    .param p1, "f"    # Lcom/google/gson/FieldAttributes;

    .prologue
    .line 27
    invoke-virtual {p1}, Lcom/google/gson/FieldAttributes;->getDeclaredClass()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/gson/AnonymousAndLocalClassExclusionStrategy;->isAnonymousOrLocal(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method
