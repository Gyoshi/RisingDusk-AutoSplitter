state("Rising Dusk")
{
    int scene : 0x846D1C, 0x40;
}

startup
{
    vars.endTime = TimeSpan.FromSeconds(0);
    vars.endCheck = false;
}

start
{
    return old.scene == 86 && current.scene == 85;
}

onStart
{
    vars.endCheck = false;
}

update
{
    // Detect when Odokuro is defeated
    if (old.scene != 101 && current.scene == 101)
    {
        vars.endCheck = true;
        vars.endTime = timer.CurrentTime.RealTime;
    } 
}
split
{ 
    // Split when entering overworld 
    if (old.scene != 24 && current.scene == 24)
    {
        return true;
    }
    // Split 4.66s after Odokuro is defeated (on white-out)
    if (vars.endCheck && timer.CurrentTime.RealTime >= vars.endTime + TimeSpan.FromSeconds(4.66))
    {
        return true;
    }
}