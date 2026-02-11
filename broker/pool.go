package main

import (
	"container/heap"
	"sync"
)

/*
Organization for different pools of available proxies. Snowflakes in the same proxy
poll may share properties, such as NAT compatability to facilitate matching
with clients
*/

type SnowflakePool struct {
	*SnowflakeHeap
	lock sync.Mutex

	// Match is a function that returns whether the snowflake
	// can be matched with a proxy in this pool
	Match func(ClientOffer) bool

	// Belongs is a function that returns whether a snowflake
	// should be added to this pool
	Belongs func(ProxyPoll) bool
}

func NewSnowflakePool() *SnowflakePool {
	snowflakes := new(SnowflakeHeap)
	heap.Init(snowflakes)

	return &SnowflakePool{
		SnowflakeHeap: snowflakes,
	}
}
