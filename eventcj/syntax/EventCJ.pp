[
   Package                        -- KW["package"] _1 KW[";"] _2,
   Package.2:iter-star            -- _1,
   Import                         -- KW["import"] _1 KW[";"],
   Switch                         -- KW["direction"] _1 KW["{"] _2 _3 KW["}"],
   Switch.2:iter-star             -- _1,
   Switch.3:iter-star             -- _1,
   Class                          -- KW["class"] _1 KW["extends"] _2 KW["{"] _3 KW["}"],
   Class.3:iter-star              -- _1,
   Layer                          -- KW["layer"] _1 KW["{"] _2 KW["}"],
   Layer.2:iter-star              -- _1,
   AfterPartialMethod             -- KW["after"] _1 _2 KW["("] _3 KW[")"] KW["{"] KW["}"],
   EventDecl                      -- KW["declare"] KW["event"] _1 KW["("] _2 KW[")"] KW[":"] _3 KW[";"],
   TransitionRuleDecl             -- KW["transition"] _1 KW["("] _2 KW[")"] KW[":"] _3 _4 KW[";"],
   TransitionRuleDecl.4:iter-star -- _1,
   TransitionRule                 -- _1 KW["->"] _2,
   FormalParams                   -- _1 _2 _3,
   FormalParams.3:iter-star       -- _1,
   FormalParam                    -- KW[","] _1 _2,
   AndSelector                    -- _1 KW["&&"] _2,
   TargetSelector                 -- KW["target"] KW["("] _1 KW[")"],
   BeforeBlock                    -- KW["before"] KW["{"] KW["}"],
   AfterBlock                     -- KW["after"] KW["{"] KW["}"]
]