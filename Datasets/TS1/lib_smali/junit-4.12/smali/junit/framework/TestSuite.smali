.class public Ljunit/framework/TestSuite;
.super Ljava/lang/Object;
.source "TestSuite.java"

# interfaces
.implements Ljunit/framework/Test;


# instance fields
.field private fName:Ljava/lang/String;

.field private fTests:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljunit/framework/Test;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v0, Ljava/util/Vector;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    .line 120
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 128
    .local p1, "theClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v0, Ljava/util/Vector;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    .line 129
    invoke-direct {p0, p1}, Ljunit/framework/TestSuite;->addTestsFromTestCase(Ljava/lang/Class;)V

    .line 130
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 3
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljunit/framework/TestCase;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 165
    .local p1, "theClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljunit/framework/TestCase;>;"
    invoke-direct {p0, p1}, Ljunit/framework/TestSuite;-><init>(Ljava/lang/Class;)V

    .line 166
    invoke-virtual {p0, p2}, Ljunit/framework/TestSuite;->setName(Ljava/lang/String;)V

    .line 167
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v0, Ljava/util/Vector;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    .line 173
    invoke-virtual {p0, p1}, Ljunit/framework/TestSuite;->setName(Ljava/lang/String;)V

    .line 174
    return-void
.end method

.method public varargs constructor <init>([Ljava/lang/Class;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 181
    .local p1, "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v4, Ljava/util/Vector;

    const/16 v5, 0xa

    invoke-direct {v4, v5}, Ljava/util/Vector;-><init>(I)V

    iput-object v4, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    .line 182
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_f
    if-ge v2, v3, :cond_1d

    aget-object v1, v0, v2

    .line 183
    .local v1, "each":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, v1}, Ljunit/framework/TestSuite;->testCaseForClass(Ljava/lang/Class;)Ljunit/framework/Test;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljunit/framework/TestSuite;->addTest(Ljunit/framework/Test;)V

    .line 182
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 185
    .end local v1    # "each":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1d
    return-void
.end method

.method public constructor <init>([Ljava/lang/Class;Ljava/lang/String;)V
    .registers 3
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<+",
            "Ljunit/framework/TestCase;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 201
    .local p1, "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<+Ljunit/framework/TestCase;>;"
    invoke-direct {p0, p1}, Ljunit/framework/TestSuite;-><init>([Ljava/lang/Class;)V

    .line 202
    invoke-virtual {p0, p2}, Ljunit/framework/TestSuite;->setName(Ljava/lang/String;)V

    .line 203
    return-void
.end method

.method private addTestMethod(Ljava/lang/reflect/Method;Ljava/util/List;Ljava/lang/Class;)V
    .registers 7
    .param p1, "m"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 296
    .local p2, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "theClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    .line 297
    .local v0, "name":Ljava/lang/String;
    invoke-interface {p2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 308
    :cond_a
    :goto_a
    return-void

    .line 300
    :cond_b
    invoke-direct {p0, p1}, Ljunit/framework/TestSuite;->isPublicTestMethod(Ljava/lang/reflect/Method;)Z

    move-result v1

    if-nez v1, :cond_4a

    .line 301
    invoke-direct {p0, p1}, Ljunit/framework/TestSuite;->isTestMethod(Ljava/lang/reflect/Method;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 302
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Test method isn\'t public: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljunit/framework/TestSuite;->warning(Ljava/lang/String;)Ljunit/framework/Test;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljunit/framework/TestSuite;->addTest(Ljunit/framework/Test;)V

    goto :goto_a

    .line 306
    :cond_4a
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    invoke-static {p3, v0}, Ljunit/framework/TestSuite;->createTest(Ljava/lang/Class;Ljava/lang/String;)Ljunit/framework/Test;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljunit/framework/TestSuite;->addTest(Ljunit/framework/Test;)V

    goto :goto_a
.end method

.method private addTestsFromTestCase(Ljava/lang/Class;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 133
    .local p1, "theClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Ljunit/framework/TestSuite;->fName:Ljava/lang/String;

    .line 135
    :try_start_6
    invoke-static {p1}, Ljunit/framework/TestSuite;->getTestConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_9
    .catch Ljava/lang/NoSuchMethodException; {:try_start_6 .. :try_end_9} :catch_38

    .line 141
    invoke-virtual {p1}, Ljava/lang/Class;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v7

    if-nez v7, :cond_5e

    .line 142
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Class "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is not public"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljunit/framework/TestSuite;->warning(Ljava/lang/String;)Ljunit/framework/Test;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljunit/framework/TestSuite;->addTest(Ljunit/framework/Test;)V

    .line 157
    :cond_37
    :goto_37
    return-void

    .line 136
    :catch_38
    move-exception v1

    .line 137
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Class "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " has no public constructor TestCase(String name) or TestCase()"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljunit/framework/TestSuite;->warning(Ljava/lang/String;)Ljunit/framework/Test;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljunit/framework/TestSuite;->addTest(Ljunit/framework/Test;)V

    goto :goto_37

    .line 146
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :cond_5e
    move-object v6, p1

    .line 147
    .local v6, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .local v5, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_64
    const-class v7, Ljunit/framework/Test;

    invoke-virtual {v7, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_81

    .line 149
    invoke-static {v6}, Lorg/junit/internal/MethodSorter;->getDeclaredMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_72
    if-ge v3, v4, :cond_7c

    aget-object v2, v0, v3

    .line 150
    .local v2, "each":Ljava/lang/reflect/Method;
    invoke-direct {p0, v2, v5, p1}, Ljunit/framework/TestSuite;->addTestMethod(Ljava/lang/reflect/Method;Ljava/util/List;Ljava/lang/Class;)V

    .line 149
    add-int/lit8 v3, v3, 0x1

    goto :goto_72

    .line 152
    .end local v2    # "each":Ljava/lang/reflect/Method;
    :cond_7c
    invoke-virtual {v6}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    goto :goto_64

    .line 154
    .end local v0    # "arr$":[Ljava/lang/reflect/Method;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_81
    iget-object v7, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v7

    if-nez v7, :cond_37

    .line 155
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "No tests found in "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljunit/framework/TestSuite;->warning(Ljava/lang/String;)Ljunit/framework/Test;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljunit/framework/TestSuite;->addTest(Ljunit/framework/Test;)V

    goto :goto_37
.end method

.method public static createTest(Ljava/lang/Class;Ljava/lang/String;)Ljunit/framework/Test;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljunit/framework/Test;"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "theClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0}, Ljunit/framework/TestSuite;->getTestConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_3} :catch_20

    move-result-object v1

    .line 59
    .local v1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    array-length v4, v4

    if-nez v4, :cond_43

    .line 60
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 61
    .local v3, "test":Ljava/lang/Object;
    instance-of v4, v3, Ljunit/framework/TestCase;

    if-eqz v4, :cond_1d

    .line 62
    move-object v0, v3

    check-cast v0, Ljunit/framework/TestCase;

    move-object v4, v0

    invoke-virtual {v4, p1}, Ljunit/framework/TestCase;->setName(Ljava/lang/String;)V
    :try_end_1d
    .catch Ljava/lang/InstantiationException; {:try_start_4 .. :try_end_1d} :catch_4e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_1d} :catch_7b
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_1d} :catch_ad

    .line 74
    :cond_1d
    :goto_1d
    check-cast v3, Ljunit/framework/Test;

    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v3    # "test":Ljava/lang/Object;
    :goto_1f
    return-object v3

    .line 54
    :catch_20
    move-exception v2

    .line 55
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " has no public constructor TestCase(String name) or TestCase()"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljunit/framework/TestSuite;->warning(Ljava/lang/String;)Ljunit/framework/Test;

    move-result-object v3

    goto :goto_1f

    .line 65
    .end local v2    # "e":Ljava/lang/NoSuchMethodException;
    .restart local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_43
    const/4 v4, 0x1

    :try_start_44
    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4c
    .catch Ljava/lang/InstantiationException; {:try_start_44 .. :try_end_4c} :catch_4e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_44 .. :try_end_4c} :catch_7b
    .catch Ljava/lang/IllegalAccessException; {:try_start_44 .. :try_end_4c} :catch_ad

    move-result-object v3

    .restart local v3    # "test":Ljava/lang/Object;
    goto :goto_1d

    .line 67
    .end local v3    # "test":Ljava/lang/Object;
    :catch_4e
    move-exception v2

    .line 68
    .local v2, "e":Ljava/lang/InstantiationException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cannot instantiate test case: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Ljunit/framework/TestSuite;->exceptionToString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljunit/framework/TestSuite;->warning(Ljava/lang/String;)Ljunit/framework/Test;

    move-result-object v3

    goto :goto_1f

    .line 69
    .end local v2    # "e":Ljava/lang/InstantiationException;
    :catch_7b
    move-exception v2

    .line 70
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in constructor: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v5

    invoke-static {v5}, Ljunit/framework/TestSuite;->exceptionToString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljunit/framework/TestSuite;->warning(Ljava/lang/String;)Ljunit/framework/Test;

    move-result-object v3

    goto/16 :goto_1f

    .line 71
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_ad
    move-exception v2

    .line 72
    .local v2, "e":Ljava/lang/IllegalAccessException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cannot access test case: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Ljunit/framework/TestSuite;->exceptionToString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljunit/framework/TestSuite;->warning(Ljava/lang/String;)Ljunit/framework/Test;

    move-result-object v3

    goto/16 :goto_1f
.end method

.method private static exceptionToString(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 4
    .param p0, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 106
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 107
    .local v0, "stringWriter":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 108
    .local v1, "writer":Ljava/io/PrintWriter;
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 109
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getTestConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .local p0, "theClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    .line 83
    const/4 v0, 0x1

    :try_start_2
    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljava/lang/String;

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_c} :catch_e

    move-result-object v0

    .line 87
    :goto_d
    return-object v0

    .line 84
    :catch_e
    move-exception v0

    .line 87
    new-array v0, v3, [Ljava/lang/Class;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    goto :goto_d
.end method

.method private isPublicTestMethod(Ljava/lang/reflect/Method;)Z
    .registers 3
    .param p1, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 311
    invoke-direct {p0, p1}, Ljunit/framework/TestSuite;->isTestMethod(Ljava/lang/reflect/Method;)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private isTestMethod(Ljava/lang/reflect/Method;)Z
    .registers 4
    .param p1, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 315
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_21

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "test"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    const/4 v0, 0x1

    :goto_20
    return v0

    :cond_21
    const/4 v0, 0x0

    goto :goto_20
.end method

.method private testCaseForClass(Ljava/lang/Class;)Ljunit/framework/Test;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljunit/framework/Test;"
        }
    .end annotation

    .prologue
    .line 188
    .local p1, "each":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljunit/framework/TestCase;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 189
    new-instance v0, Ljunit/framework/TestSuite;

    const-class v1, Ljunit/framework/TestCase;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Ljunit/framework/TestSuite;-><init>(Ljava/lang/Class;)V

    .line 191
    :goto_13
    return-object v0

    :cond_14
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " does not extend TestCase"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljunit/framework/TestSuite;->warning(Ljava/lang/String;)Ljunit/framework/Test;

    move-result-object v0

    goto :goto_13
.end method

.method public static warning(Ljava/lang/String;)Ljunit/framework/Test;
    .registers 3
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 94
    new-instance v0, Ljunit/framework/TestSuite$1;

    const-string v1, "warning"

    invoke-direct {v0, v1, p0}, Ljunit/framework/TestSuite$1;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public addTest(Ljunit/framework/Test;)V
    .registers 3
    .param p1, "test"    # Ljunit/framework/Test;

    .prologue
    .line 209
    iget-object v0, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 210
    return-void
.end method

.method public addTestSuite(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljunit/framework/TestCase;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 216
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljunit/framework/TestCase;>;"
    new-instance v0, Ljunit/framework/TestSuite;

    invoke-direct {v0, p1}, Ljunit/framework/TestSuite;-><init>(Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Ljunit/framework/TestSuite;->addTest(Ljunit/framework/Test;)V

    .line 217
    return-void
.end method

.method public countTestCases()I
    .registers 5

    .prologue
    .line 223
    const/4 v0, 0x0

    .line 224
    .local v0, "count":I
    iget-object v3, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_19

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljunit/framework/Test;

    .line 225
    .local v1, "each":Ljunit/framework/Test;
    invoke-interface {v1}, Ljunit/framework/Test;->countTestCases()I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_7

    .line 227
    .end local v1    # "each":Ljunit/framework/Test;
    :cond_19
    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Ljunit/framework/TestSuite;->fName:Ljava/lang/String;

    return-object v0
.end method

.method public run(Ljunit/framework/TestResult;)V
    .registers 5
    .param p1, "result"    # Ljunit/framework/TestResult;

    .prologue
    .line 243
    iget-object v2, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljunit/framework/Test;

    .line 244
    .local v0, "each":Ljunit/framework/Test;
    invoke-virtual {p1}, Ljunit/framework/TestResult;->shouldStop()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 249
    .end local v0    # "each":Ljunit/framework/Test;
    :cond_18
    return-void

    .line 247
    .restart local v0    # "each":Ljunit/framework/Test;
    :cond_19
    invoke-virtual {p0, v0, p1}, Ljunit/framework/TestSuite;->runTest(Ljunit/framework/Test;Ljunit/framework/TestResult;)V

    goto :goto_6
.end method

.method public runTest(Ljunit/framework/Test;Ljunit/framework/TestResult;)V
    .registers 3
    .param p1, "test"    # Ljunit/framework/Test;
    .param p2, "result"    # Ljunit/framework/TestResult;

    .prologue
    .line 252
    invoke-interface {p1, p2}, Ljunit/framework/Test;->run(Ljunit/framework/TestResult;)V

    .line 253
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 261
    iput-object p1, p0, Ljunit/framework/TestSuite;->fName:Ljava/lang/String;

    .line 262
    return-void
.end method

.method public testAt(I)Ljunit/framework/Test;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 268
    iget-object v0, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljunit/framework/Test;

    return-object v0
.end method

.method public testCount()I
    .registers 2

    .prologue
    .line 275
    iget-object v0, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method public tests()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration",
            "<",
            "Ljunit/framework/Test;",
            ">;"
        }
    .end annotation

    .prologue
    .line 282
    iget-object v0, p0, Ljunit/framework/TestSuite;->fTests:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 289
    invoke-virtual {p0}, Ljunit/framework/TestSuite;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 290
    invoke-virtual {p0}, Ljunit/framework/TestSuite;->getName()Ljava/lang/String;

    move-result-object v0

    .line 292
    :goto_a
    return-object v0

    :cond_b
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method
