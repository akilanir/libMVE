.class public abstract Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract getIterator(Ljava/util/TimeZone;J)Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;
.end method

.method abstract getLastInstance(Ljava/util/TimeZone;J)J
.end method

.method abstract isInfinite()Z
.end method
