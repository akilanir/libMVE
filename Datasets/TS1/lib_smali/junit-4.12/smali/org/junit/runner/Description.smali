.class public Lorg/junit/runner/Description;
.super Ljava/lang/Object;
.source "Description.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final EMPTY:Lorg/junit/runner/Description;

.field private static final METHOD_AND_CLASS_NAME_PATTERN:Ljava/util/regex/Pattern;

.field public static final TEST_MECHANISM:Lorg/junit/runner/Description;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final fAnnotations:[Ljava/lang/annotation/Annotation;

.field private final fChildren:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/junit/runner/Description;",
            ">;"
        }
    .end annotation
.end field

.field private final fDisplayName:Ljava/lang/String;

.field private volatile fTestClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final fUniqueId:Ljava/io/Serializable;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 33
    const-string v0, "([\\s\\S]*)\\((.*)\\)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/junit/runner/Description;->METHOD_AND_CLASS_NAME_PATTERN:Ljava/util/regex/Pattern;

    .line 130
    new-instance v0, Lorg/junit/runner/Description;

    const-string v1, "No Tests"

    new-array v2, v3, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v4, v1, v2}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)V

    sput-object v0, Lorg/junit/runner/Description;->EMPTY:Lorg/junit/runner/Description;

    .line 137
    new-instance v0, Lorg/junit/runner/Description;

    const-string v1, "Test mechanism"

    new-array v2, v3, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v4, v1, v2}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)V

    sput-object v0, Lorg/junit/runner/Description;->TEST_MECHANISM:Lorg/junit/runner/Description;

    return-void
.end method

.method private varargs constructor <init>(Ljava/lang/Class;Ljava/lang/String;Ljava/io/Serializable;[Ljava/lang/annotation/Annotation;)V
    .registers 7
    .param p2, "displayName"    # Ljava/lang/String;
    .param p3, "uniqueId"    # Ljava/io/Serializable;
    .param p4, "annotations"    # [Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            "[",
            "Ljava/lang/annotation/Annotation;",
            ")V"
        }
    .end annotation

    .prologue
    .line 154
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/junit/runner/Description;->fChildren:Ljava/util/Collection;

    .line 155
    if-eqz p2, :cond_12

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1a

    .line 156
    :cond_12
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The display name must not be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_1a
    if-nez p3, :cond_24

    .line 160
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The unique id must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 163
    :cond_24
    iput-object p1, p0, Lorg/junit/runner/Description;->fTestClass:Ljava/lang/Class;

    .line 164
    iput-object p2, p0, Lorg/junit/runner/Description;->fDisplayName:Ljava/lang/String;

    .line 165
    iput-object p3, p0, Lorg/junit/runner/Description;->fUniqueId:Ljava/io/Serializable;

    .line 166
    iput-object p4, p0, Lorg/junit/runner/Description;->fAnnotations:[Ljava/lang/annotation/Annotation;

    .line 167
    return-void
.end method

.method private varargs constructor <init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)V
    .registers 4
    .param p2, "displayName"    # Ljava/lang/String;
    .param p3, "annotations"    # [Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/annotation/Annotation;",
            ")V"
        }
    .end annotation

    .prologue
    .line 151
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2, p2, p3}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/io/Serializable;[Ljava/lang/annotation/Annotation;)V

    .line 152
    return-void
.end method

.method public static createSuiteDescription(Ljava/lang/Class;)Lorg/junit/runner/Description;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/runner/Description;"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lorg/junit/runner/Description;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Class;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)V

    return-object v0
.end method

.method public static varargs createSuiteDescription(Ljava/lang/String;Ljava/io/Serializable;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "uniqueId"    # Ljava/io/Serializable;
    .param p2, "annotations"    # [Ljava/lang/annotation/Annotation;

    .prologue
    .line 58
    new-instance v0, Lorg/junit/runner/Description;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0, p1, p2}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/io/Serializable;[Ljava/lang/annotation/Annotation;)V

    return-object v0
.end method

.method public static varargs createSuiteDescription(Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "annotations"    # [Ljava/lang/annotation/Annotation;

    .prologue
    .line 45
    new-instance v0, Lorg/junit/runner/Description;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0, p1}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)V

    return-object v0
.end method

.method public static createTestDescription(Ljava/lang/Class;Ljava/lang/String;)Lorg/junit/runner/Description;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lorg/junit/runner/Description;"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lorg/junit/runner/Description;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/junit/runner/Description;->formatDisplayName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, p0, v1, v2}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)V

    return-object v0
.end method

.method public static varargs createTestDescription(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "annotations"    # [Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/annotation/Annotation;",
            ")",
            "Lorg/junit/runner/Description;"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lorg/junit/runner/Description;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/junit/runner/Description;->formatDisplayName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1, p2}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)V

    return-object v0
.end method

.method public static createTestDescription(Ljava/lang/String;Ljava/lang/String;Ljava/io/Serializable;)Lorg/junit/runner/Description;
    .registers 7
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "uniqueId"    # Ljava/io/Serializable;

    .prologue
    .line 110
    new-instance v0, Lorg/junit/runner/Description;

    const/4 v1, 0x0

    invoke-static {p1, p0}, Lorg/junit/runner/Description;->formatDisplayName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v1, v2, p2, v3}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/io/Serializable;[Ljava/lang/annotation/Annotation;)V

    return-object v0
.end method

.method public static varargs createTestDescription(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;
    .registers 6
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "annotations"    # [Ljava/lang/annotation/Annotation;

    .prologue
    .line 73
    new-instance v0, Lorg/junit/runner/Description;

    const/4 v1, 0x0

    invoke-static {p1, p0}, Lorg/junit/runner/Description;->formatDisplayName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2, p2}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)V

    return-object v0
.end method

.method private static formatDisplayName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 114
    const-string v0, "%s(%s)"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private methodAndClassNamePatternGroupOrDefault(ILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "group"    # I
    .param p2, "defaultString"    # Ljava/lang/String;

    .prologue
    .line 313
    sget-object v1, Lorg/junit/runner/Description;->METHOD_AND_CLASS_NAME_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 314
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-virtual {v0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p2

    .end local p2    # "defaultString":Ljava/lang/String;
    :cond_14
    return-object p2
.end method


# virtual methods
.method public addChild(Lorg/junit/runner/Description;)V
    .registers 3
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 182
    iget-object v0, p0, Lorg/junit/runner/Description;->fChildren:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 183
    return-void
.end method

.method public childlessCopy()Lorg/junit/runner/Description;
    .registers 5

    .prologue
    .line 252
    new-instance v0, Lorg/junit/runner/Description;

    iget-object v1, p0, Lorg/junit/runner/Description;->fTestClass:Ljava/lang/Class;

    iget-object v2, p0, Lorg/junit/runner/Description;->fDisplayName:Ljava/lang/String;

    iget-object v3, p0, Lorg/junit/runner/Description;->fAnnotations:[Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v1, v2, v3}, Lorg/junit/runner/Description;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 228
    instance-of v1, p1, Lorg/junit/runner/Description;

    if-nez v1, :cond_6

    .line 229
    const/4 v1, 0x0

    .line 232
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 231
    check-cast v0, Lorg/junit/runner/Description;

    .line 232
    .local v0, "d":Lorg/junit/runner/Description;
    iget-object v1, p0, Lorg/junit/runner/Description;->fUniqueId:Ljava/io/Serializable;

    iget-object v2, v0, Lorg/junit/runner/Description;->fUniqueId:Ljava/io/Serializable;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_5
.end method

.method public getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 260
    .local p1, "annotationType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lorg/junit/runner/Description;->fAnnotations:[Ljava/lang/annotation/Annotation;

    .local v0, "arr$":[Ljava/lang/annotation/Annotation;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_4
    if-ge v2, v3, :cond_1c

    aget-object v1, v0, v2

    .line 261
    .local v1, "each":Ljava/lang/annotation/Annotation;
    invoke-interface {v1}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 262
    invoke-virtual {p1, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/annotation/Annotation;

    .line 265
    .end local v1    # "each":Ljava/lang/annotation/Annotation;
    :goto_18
    return-object v4

    .line 260
    .restart local v1    # "each":Ljava/lang/annotation/Annotation;
    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 265
    .end local v1    # "each":Ljava/lang/annotation/Annotation;
    :cond_1c
    const/4 v4, 0x0

    goto :goto_18
.end method

.method public getAnnotations()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 272
    iget-object v0, p0, Lorg/junit/runner/Description;->fAnnotations:[Ljava/lang/annotation/Annotation;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getChildren()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/junit/runner/Description;",
            ">;"
        }
    .end annotation

    .prologue
    .line 190
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/junit/runner/Description;->fChildren:Ljava/util/Collection;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 300
    iget-object v0, p0, Lorg/junit/runner/Description;->fTestClass:Ljava/lang/Class;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/junit/runner/Description;->fTestClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x2

    invoke-virtual {p0}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/junit/runner/Description;->methodAndClassNamePatternGroupOrDefault(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public getDisplayName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 173
    iget-object v0, p0, Lorg/junit/runner/Description;->fDisplayName:Ljava/lang/String;

    return-object v0
.end method

.method public getMethodName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 308
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/junit/runner/Description;->methodAndClassNamePatternGroupOrDefault(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTestClass()Ljava/lang/Class;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 280
    iget-object v3, p0, Lorg/junit/runner/Description;->fTestClass:Ljava/lang/Class;

    if-eqz v3, :cond_8

    .line 281
    iget-object v2, p0, Lorg/junit/runner/Description;->fTestClass:Ljava/lang/Class;

    .line 291
    :cond_7
    :goto_7
    return-object v2

    .line 283
    :cond_8
    invoke-virtual {p0}, Lorg/junit/runner/Description;->getClassName()Ljava/lang/String;

    move-result-object v1

    .line 284
    .local v1, "name":Ljava/lang/String;
    if-eqz v1, :cond_7

    .line 288
    const/4 v3, 0x0

    :try_start_f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-static {v1, v3, v4}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p0, Lorg/junit/runner/Description;->fTestClass:Ljava/lang/Class;

    .line 289
    iget-object v2, p0, Lorg/junit/runner/Description;->fTestClass:Ljava/lang/Class;
    :try_end_1f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_f .. :try_end_1f} :catch_20

    goto :goto_7

    .line 290
    :catch_20
    move-exception v0

    .line 291
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    goto :goto_7
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lorg/junit/runner/Description;->fUniqueId:Ljava/io/Serializable;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 244
    sget-object v0, Lorg/junit/runner/Description;->EMPTY:Lorg/junit/runner/Description;

    invoke-virtual {p0, v0}, Lorg/junit/runner/Description;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSuite()Z
    .registers 2

    .prologue
    .line 197
    invoke-virtual {p0}, Lorg/junit/runner/Description;->isTest()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isTest()Z
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lorg/junit/runner/Description;->fChildren:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public testCount()I
    .registers 5

    .prologue
    .line 211
    invoke-virtual {p0}, Lorg/junit/runner/Description;->isTest()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 212
    const/4 v2, 0x1

    .line 218
    :cond_7
    return v2

    .line 214
    :cond_8
    const/4 v2, 0x0

    .line 215
    .local v2, "result":I
    iget-object v3, p0, Lorg/junit/runner/Description;->fChildren:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/Description;

    .line 216
    .local v0, "child":Lorg/junit/runner/Description;
    invoke-virtual {v0}, Lorg/junit/runner/Description;->testCount()I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_f
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 237
    invoke-virtual {p0}, Lorg/junit/runner/Description;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
