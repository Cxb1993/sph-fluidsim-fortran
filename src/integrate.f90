module integrate

  ! Implementation of functions and subroutines for the numerical integration
  ! current method: leapfrog method

  !Created by Jannik Zuern on 05/16/2016
  !Last modified: 05/16/2016

  implicit none

contains
  subroutine leapfrog_step(state, dt)
    use util
    type (systemstate) state
    double precision :: dt

    state%vh = state%v + (state%a  * dt/2)
    state%v  = state%v + (state%a  * dt)
    state%x  = state%x + (state%vh * dt)

    ! const float* a = s->a;
    ! float*  vh = s->vh;
    ! float*  v = s->v;
    ! float*  x = s->x;
    ! int n = s->n;
    !
    ! for (int i = 0; i < 2*n; ++i) vh[i] = v[i] + a[i] * dt/2;
    ! for (int i = 0; i < 2*n; ++i) v[i] += a[i] * dt;
    ! for (int i = 0; i < 2*n; ++i) x[i] += vh[i] * dt;

    ! reflect_bc(s);
    return
  end


  subroutine leapfrog_start(state, dt)
    use util
    type (systemstate) state
    double precision :: dt

    ! const float*  a = s->a;
    ! float*  vh = s->vh;
    ! float*  v = s->v;
    ! float*  x = s->x;
    ! int n = s->n;
    !
    ! for (int i = 0; i < 2*n; ++i) vh[i] += a[i] * dt;
    ! for (int i = 0; i < 2*n; ++i) v[i] = vh[i] + a[i] * dt / 2;
    ! for (int i = 0; i < 2*n; ++i) x[i] += vh[i] * dt;
    !
    ! reflect_bc(s);

    return
  end


end module integrate
